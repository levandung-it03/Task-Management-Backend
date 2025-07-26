```java
package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.*;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.wrapper.GeneralTokenClaims;
import com.ptithcm.intern_project.common.wrapper.TokenInfo;
import com.ptithcm.intern_project.dto.general.TokenDTO;
import com.ptithcm.intern_project.jpa.model.Account;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.AccountRepository;
import com.ptithcm.intern_project.jpa.repository.AuthorityRepository;
import com.ptithcm.intern_project.jpa.repository.UserInfoRepository;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.redis.crud.*;
import com.ptithcm.intern_project.redis.model.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;

@Service
@RequiredArgsConstructor
@EnableAspectJAutoProxy(exposeProxy = true)
public class AccountService {
    private final AuthorityRepository authorityRepository;
    private final InvalidTokenCrud invalidTokenCrud;
    @Getter
    private final AccountRepository accountRepository;
    private final RefreshTokenCrud refreshTokenCrud;
    private final JwtService jwtService;
    private final PasswordEncoder userPasswordEncoder;
    private final EmailService emailService;
    private final RegisterOtpCrud registerOtpCrud;
    private final LostPassOtpCrud lostPassOtpCrud;
    private final ChangePassOtpCrud changePassOtpCrud;
    private final UserInfoRepository userInfoRepository;

    public AuthResponse authenticate(AuthRequest dto) {
        Account authAccount = accountRepository.findByUsername(dto.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_CREDENTIALS));

        if (!userPasswordEncoder.matches(dto.getPassword(), authAccount.getPassword()))
            throw new AppExc(ErrorCodes.INVALID_CREDENTIALS);

        if (!authAccount.isStatus() || Objects.nonNull(authAccount.getOauth2ServiceEnum()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoRepository.findByAccountId(authAccount.getId())
            .orElseThrow(() -> new AppExc(ErrorCodes.FORBIDDEN_USER));
        TokenInfo accessTokenInfo = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(authAccount.getUsername())
            .owner(userInfo.getFullName())
            .scopes(Account.buildScope(authAccount.getAuthorities()))
            .typeEnum(TokenTypes.ACCESS)
            .isOauth2(false)
            .build());
        TokenInfo refreshTokenInfo = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(authAccount.getUsername())
            .owner(userInfo.getFullName())
            .scopes(Account.buildScope(authAccount.getAuthorities()))
            .typeEnum(TokenTypes.REFRESH)
            .isOauth2(false)
            .build());

        refreshTokenCrud.save(RefreshToken.builder().id(refreshTokenInfo.getJti()).build());
        return AuthResponse.builder()
            .accessToken(accessTokenInfo.getToken())
            .refreshToken(refreshTokenInfo.getToken())
            .build();
    }

    public TokenDTO refreshToken(String refreshToken, String accessToken) {
        HashMap<String, String> refreshClaims = jwtService.readPayload(refreshToken);
        HashMap<String, String> accessClaims = jwtService.readPayload(accessToken);
        Account authAccount = accountRepository.findByUsername(accessClaims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        if (!authAccount.isStatus())
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoRepository.findByAccountId(authAccount.getId())
            .orElseThrow(() -> new AppExc(ErrorCodes.FORBIDDEN_USER));
        TokenInfo accessTokenInfo = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(authAccount.getUsername())
            .owner(userInfo.getFullName())
            .scopes(Account.buildScope(authAccount.getAuthorities()))
            .typeEnum(TokenTypes.ACCESS)
            .isOauth2(Boolean.parseBoolean(refreshClaims.get(TokenClaimNames.IS_OAUTH2.getStr())))
            .build());

        return TokenDTO.builder().accessToken(accessTokenInfo.getToken()).build();
    }

    public void logout(String refreshToken, String accessToken) {
        //--Reached this method means 'accessToken' and 'refreshToken' are both valid (passed JwtAuthFilter).
        HashMap<String, String> accessClaims = jwtService.readPayload(accessToken);
        HashMap<String, String> refreshClaims = jwtService.readPayload(refreshToken);
        int exp = Integer.parseInt(refreshClaims.get("exp"));

        refreshTokenCrud.deleteById(refreshClaims.get("jti"));
        if (new Date(System.currentTimeMillis()).before(new Date(exp)))
            invalidTokenCrud.save(InvalidToken.builder()
                .id(accessClaims.get("jti"))
                .expiryDate(new Date(exp).toInstant())
                .build());
    }

    public VerifyEmailResponse authorizeEmailByOtp(String token) {
        Map<String, String> emailCustom = emailService.getEmailCustom();
        String email = jwtService.readPayload(token).getOrDefault("sub", "");
        Account account = accountRepository.findByUsername(email)
            .orElseThrow(() -> new AppExc(ErrorCodes.WEIRD_TOKEN_SUBJECT));

        if (Objects.nonNull(account.getOauth2ServiceEnum()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);
        if (changePassOtpCrud.existsById(email))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);

        String otp = OtpGenerator.randOTP();
        changePassOtpCrud.save(ChangePassOtp.builder()
            .email(email)
            .otp(otp)
            .build());
        emailService.sendSimpleEmail(
            email,
            String.format(emailCustom.get("subject"), "Register OTP"),
            String.format(emailCustom.get("msg"), email, otp));
        return VerifyEmailResponse.builder().otpAgeInSeconds(ChangePassOtp.OTP_AGE).build();
    }

    public VerifyEmailResponse verifyEmailByOtp(VerifyEmailRequest dto) {
        Map<String, String> emailCustom = emailService.getEmailCustom();
        String otp = OtpGenerator.randOTP();
        switch (OtpTypes.valueOf(dto.getOtpType())) {
            case OtpTypes.REGISTER:
                if (accountRepository.existsByUsername(dto.getEmail()))
                    throw new AppExc(ErrorCodes.DUPLICATED_EMAIL);
                if (registerOtpCrud.existsById(dto.getEmail()))
                    throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);
                registerOtpCrud.save(RegisterOtp.builder()
                    .email(dto.getEmail())
                    .otp(otp)
                    .build());
                emailService.sendSimpleEmail(
                    dto.getEmail(),
                    String.format(emailCustom.get("subject"), "Register OTP"),
                    String.format(emailCustom.get("msg"), dto.getEmail(), otp));
                return VerifyEmailResponse.builder().otpAgeInSeconds(RegisterOtp.OTP_AGE).build();

            case OtpTypes.LOST_PASSWORD:
                Account account = accountRepository.findByUsername(dto.getEmail())
                    .orElseThrow(() -> new AppExc(ErrorCodes.EMAIL_NOT_FOUND));
                if (Objects.nonNull(account.getOauth2ServiceEnum()))
                    throw new AppExc(ErrorCodes.FORBIDDEN_USER);
                if (lostPassOtpCrud.existsById(dto.getEmail()))
                    throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);
                lostPassOtpCrud.save(LostPassOtp.builder()
                    .email(dto.getEmail())
                    .otp(otp)
                    .build());
                emailService.sendSimpleEmail(
                    dto.getEmail(),
                    String.format(emailCustom.get("subject"), "Lost Password OTP"),
                    String.format(emailCustom.get("msg"), dto.getEmail(), otp));
                return VerifyEmailResponse.builder().otpAgeInSeconds(LostPassOtp.OTP_AGE).build();

            default:
                throw new AppExc(ErrorCodes.OTP_TYPE_NOT_FOUND);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    public void register(RegisterRequest dto) {
        if (accountRepository.existsByUsername(dto.getEmail()))
            throw new AppExc(ErrorCodes.DUPLICATED_EMAIL);

        RegisterOtp otp = registerOtpCrud.findById(dto.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.OTP_NOT_FOUND));
        if (!otp.getOtp().equals(dto.getOtp()))
            throw new AppExc(ErrorCodes.OTP_NOT_CORRECT);

        this.registerUserCore(dto);
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    public void registerUserCore(RegisterRequest dto) {
        var authorities = List.of(
            authorityRepository.findByEnumStr(AuthorityEnum.ROLE_USER.toString())
                .orElseThrow(() -> new AppExc(ErrorCodes.UNAWARE_ERROR))
        );
        var oauth2Enum = (dto.getOauth2Service() == null) ? null : Oauth2ServiceEnum.valueOf(dto.getOauth2Service());
        var savedAccount = accountRepository.save(Account.builder()
            .authorities(authorities)
            .username(dto.getEmail())
            .password(userPasswordEncoder.encode(dto.getPassword()))
            .active(true)
            .createdTime(LocalDateTime.now(ZoneId.systemDefault()))
            .oauth2ServiceEnum(oauth2Enum)
            .build());
        userInfoRepository.save(UserInfo.builder()
            .fullName(dto.getFullName())
            .account(savedAccount)
            .dob(dto.getDob())
            .build());
        //--Put it at the last position to make sure any exc above will not delete OTP.
        registerOtpCrud.deleteById(dto.getEmail());
    }

    public AuthResponse oauth2Authenticate(DTO_Oauth2Authenticate dto) {
        Map<String, Object> oauth2UserInfo = oauth2Service.authenticateUser(dto);
        if (!accountRepository.existsByUsername(oauth2UserInfo.get("sub").toString())) {
            var savedUserDto = RegisterRequest.builder()
                .email(oauth2UserInfo.get("sub").toString())
                .password(UUID.randomUUID().toString())
                .fullName(oauth2UserInfo.get("owner").toString())
                .oauth2Service(oauth2UserInfo.get("oauth2Service").toString())
                .build();
            if (Objects.nonNull(oauth2UserInfo.get("gender")))
                savedUserDto.setGender(oauth2UserInfo.get("gender").toString());
            if (Objects.nonNull(oauth2UserInfo.get("dob")))
                savedUserDto.setDob((LocalDate) oauth2UserInfo.get("dob"));
            ((AccountService) AopContext.currentProxy()).registerUserCore(savedUserDto);
        }
        TokenInfo accessTokenInfo = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(oauth2UserInfo.get("sub").toString())
            .owner(oauth2UserInfo.get("owner").toString())
            .scopes(oauth2UserInfo.get("scopes").toString())
            .typeEnum(TokenTypes.ACCESS)
            .isOauth2(true)
            .build());
        TokenInfo refreshTokenInfo = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(oauth2UserInfo.get("sub").toString())
            .owner(oauth2UserInfo.get("owner").toString())
            .scopes(oauth2UserInfo.get("scopes").toString())
            .typeEnum(TokenTypes.REFRESH)
            .isOauth2(true)
            .build());
        refreshTokenCrud.save(RefreshToken.builder().id(refreshTokenInfo.getJti()).build());
        return AuthResponse.builder()
            .accessToken(accessTokenInfo.getToken())
            .refreshToken(refreshTokenInfo.getToken())
            .build();
    }

    public Map<String, String> getOauth2Authorizer(String oauth2Enum) {
        return Map.of("authorizer", oauth2Service.getOauth2Authorizer(Oauth2ServiceEnum.valueOf(oauth2Enum)));
    }

    public void lostPassword(LostPassRequest dto) {
        Map<String, String> emailCustom = emailService.getEmailCustom();
        var account = accountRepository.findByUsername(dto.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.EMAIL_NOT_FOUND));

        LostPassOtp otp = lostPassOtpCrud.findById(dto.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.OTP_NOT_FOUND));
        if (!otp.getOtp().equals(dto.getOtp()))
            throw new AppExc(ErrorCodes.OTP_NOT_CORRECT);

        if (!account.isStatus() || Objects.nonNull(account.getOauth2ServiceEnum()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        String newPassword = OtpGenerator.randOTP();
        account.setPassword(userPasswordEncoder.encode(newPassword));
        accountRepository.save(account);

        emailService.sendSimpleEmail(
            dto.getEmail(),
            String.format(emailCustom.get("subject"), "New Password"),
            String.format(emailCustom.get("msg"), dto.getEmail(), newPassword));
    }

    public void changePassword(String token, ChangePassRequest dto) {
        String email = jwtService.readPayload(token).getOrDefault("sub", "");
        Account account = accountRepository.findByUsername(email)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        if (Objects.nonNull(account.getOauth2ServiceEnum()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        account.setPassword(userPasswordEncoder.encode(dto.getPassword()));
        accountRepository.save(account);
    }
}
```