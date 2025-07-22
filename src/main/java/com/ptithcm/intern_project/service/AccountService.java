package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.*;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.common.wrapper.GeneralTokenClaims;
import com.ptithcm.intern_project.common.wrapper.TokenInfo;
import com.ptithcm.intern_project.jpa.model.Account;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.AccountRepository;
import com.ptithcm.intern_project.jpa.repository.DepartmentRepository;
import com.ptithcm.intern_project.jpa.repository.UserInfoRepository;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.redis.crud.*;
import com.ptithcm.intern_project.redis.model.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
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
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AccountService {
    @Getter
    AccountRepository accountRepository;
    AuthorityService authorityService;
    InvalidTokenCrud invalidTokenCrud;
    RefreshTokenCrud refreshTokenCrud;
    JwtService jwtService;
    PasswordEncoder userPasswordEncoder;
    EmailService emailService;
    RegisterOtpCrud registerOtpCrud;
    LostPassOtpCrud lostPassOtpCrud;
    ChangePassOtpCrud changePassOtpCrud;
    UserInfoRepository userInfoRepository;
    DepartmentRepository departmentRepository;

    public AuthResponse authenticate(AuthRequest dto) {
        Account authAccount = accountRepository.findByUsername(dto.getUsername())
            .orElseThrow(() -> new ApplicationException(ErrorCodes.INVALID_CREDENTIALS));

        if (!userPasswordEncoder.matches(dto.getPassword(), authAccount.getPassword()))
            throw new ApplicationException(ErrorCodes.INVALID_CREDENTIALS);

        if (!authAccount.isStatus())
            throw new ApplicationException(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoRepository.findByAccountId(authAccount.getId())
            .orElseThrow(() -> new ApplicationException(ErrorCodes.FORBIDDEN_USER));
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
            .orElseThrow(() -> new ApplicationException(ErrorCodes.INVALID_TOKEN));

        if (!authAccount.isStatus())
            throw new ApplicationException(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoRepository.findByAccountId(authAccount.getId())
            .orElseThrow(() -> new ApplicationException(ErrorCodes.FORBIDDEN_USER));
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

        if (!accountRepository.existsByUsername(email))
            throw new ApplicationException(ErrorCodes.WEIRD_TOKEN_SUBJECT);
        if (changePassOtpCrud.existsById(email))
            throw new ApplicationException(ErrorCodes.OTP_HAS_NOT_EXPIRED);

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
                    throw new ApplicationException(ErrorCodes.DUPLICATED_EMAIL);
                if (registerOtpCrud.existsById(dto.getEmail()))
                    throw new ApplicationException(ErrorCodes.OTP_HAS_NOT_EXPIRED);
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
                if (!accountRepository.existsByUsername(dto.getEmail()))
                    throw new ApplicationException(ErrorCodes.EMAIL_NOT_FOUND);
                if (lostPassOtpCrud.existsById(dto.getEmail()))
                    throw new ApplicationException(ErrorCodes.OTP_HAS_NOT_EXPIRED);
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
                throw new ApplicationException(ErrorCodes.OTP_TYPE_NOT_FOUND);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    public void registerNewAccount(RegisterRequest dto) {
        var department = departmentRepository.findById(dto.getDepartmentId())
            .orElseThrow(() -> new ApplicationException(ErrorCodes.INVALID_ID));
        var authorities = List.of(authorityService.findByEnumStr(AuthorityEnum.ROLE_PM));
        var savedAccount = accountRepository.save(Account.builder()
            .authorities(authorities)
            .username(dto.getUsername())
            .password(userPasswordEncoder.encode(dto.getPassword()))
            .status(true)
            .createdTime(LocalDateTime.now(ZoneId.systemDefault()))
            .updatedTime(LocalDateTime.now(ZoneId.systemDefault()))
            .build());
        userInfoRepository.save(UserInfo.builder()
            .email(dto.getEmail())
            .phone(dto.getPhone())
            .department(department)
            .fullName(dto.getFullName())
            .account(savedAccount)
            .dob(dto.getDob())
            .build());
    }

    public void lostPassword(LostPassRequest dto) {
        Map<String, String> emailCustom = emailService.getEmailCustom();
        var account = accountRepository.findByUsername(dto.getEmail())
            .orElseThrow(() -> new ApplicationException(ErrorCodes.EMAIL_NOT_FOUND));

        LostPassOtp otp = lostPassOtpCrud.findById(dto.getEmail())
            .orElseThrow(() -> new ApplicationException(ErrorCodes.OTP_NOT_FOUND));
        if (!otp.getOtp().equals(dto.getOtp()))
            throw new ApplicationException(ErrorCodes.OTP_NOT_CORRECT);

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
            .orElseThrow(() -> new ApplicationException(ErrorCodes.INVALID_TOKEN));

        account.setPassword(userPasswordEncoder.encode(dto.getPassword()));
        accountRepository.save(account);
    }
}
