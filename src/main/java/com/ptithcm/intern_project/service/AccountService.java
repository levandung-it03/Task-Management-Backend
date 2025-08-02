package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.dto.general.GeneralTokenClaims;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.dto.general.TokenInfoDTO;
import com.ptithcm.intern_project.dto.general.TokenDTO;
import com.ptithcm.intern_project.jpa.model.Account;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.jpa.repository.AccountRepository;
import com.ptithcm.intern_project.jpa.repository.DepartmentRepository;
import com.ptithcm.intern_project.jpa.repository.UserInfoRepository;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.redis.crud.*;
import com.ptithcm.intern_project.redis.model.*;
import com.ptithcm.intern_project.redis.model.enums.OtpTypes;
import com.ptithcm.intern_project.security.enums.TokenClaimNames;
import com.ptithcm.intern_project.security.enums.TokenTypes;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.security.service.OtpService;
import com.ptithcm.intern_project.service.interfaces.IAccountService;
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
public class AccountService implements IAccountService {
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
    UserInfoService userInfoService;

    @Override
    public AuthResponse authenticate(AuthRequest dto) {
        Account authAccount = accountRepository.findByUsername(dto.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_CREDENTIALS));

        if (!userPasswordEncoder.matches(dto.getPassword(), authAccount.getPassword()))
            throw new AppExc(ErrorCodes.INVALID_CREDENTIALS);

        if (!authAccount.isStatus())
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoRepository.findByAccountId(authAccount.getId())
            .orElseThrow(() -> new AppExc(ErrorCodes.FORBIDDEN_USER));
        TokenInfoDTO accessTokenInfoDTO = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(authAccount.getUsername())
            .owner(userInfo.getFullName())
            .scopes(Account.buildScope(authAccount.getAuthorities()))
            .typeEnum(TokenTypes.ACCESS)
            .isOauth2(false)
            .build());
        TokenInfoDTO refreshTokenInfoDTO = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(authAccount.getUsername())
            .owner(userInfo.getFullName())
            .scopes(Account.buildScope(authAccount.getAuthorities()))
            .typeEnum(TokenTypes.REFRESH)
            .isOauth2(false)
            .build());

        refreshTokenCrud.save(RefreshToken.builder().id(refreshTokenInfoDTO.getJti()).build());
        return AuthResponse.builder()
            .accessToken(accessTokenInfoDTO.getToken())
            .refreshToken(refreshTokenInfoDTO.getToken())
            .build();
    }

    @Override
    public TokenDTO refreshToken(String refreshToken, String accessToken) {
        HashMap<String, String> refreshClaims = jwtService.readPayload(refreshToken);
        HashMap<String, String> accessClaims = jwtService.readPayload(accessToken);
        Account authAccount = accountRepository.findByUsername(accessClaims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        if (!authAccount.isStatus())
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoRepository.findByAccountId(authAccount.getId())
            .orElseThrow(() -> new AppExc(ErrorCodes.FORBIDDEN_USER));
        TokenInfoDTO accessTokenInfoDTO = jwtService.generateToken(GeneralTokenClaims.builder()
            .subject(authAccount.getUsername())
            .owner(userInfo.getFullName())
            .scopes(Account.buildScope(authAccount.getAuthorities()))
            .typeEnum(TokenTypes.ACCESS)
            .isOauth2(Boolean.parseBoolean(refreshClaims.get(TokenClaimNames.IS_OAUTH2.getStr())))
            .build());

        return TokenDTO.builder().accessToken(accessTokenInfoDTO.getToken()).build();
    }

    @Override
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

    @Override
    public VerifyEmailResponse authorizeEmailByOtp(String token) {
        Map<String, String> mailCustom = emailService.getMailContentCustom();
        UserInfo userInfo = userInfoService.getUserInfo(token);

        if (changePassOtpCrud.existsById(userInfo.getEmail()))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);

        String otp = OtpService.randOTP();
        changePassOtpCrud.save(ChangePassOtp.builder()
            .email(userInfo.getEmail())
            .otp(otp)
            .build());
        emailService.sendSimpleEmail(
            userInfo.getEmail(),
            String.format(mailCustom.get("subject"), "Register OTP"),
            String.format(mailCustom.get("msg"), userInfo.getEmail(), otp));
        return VerifyEmailResponse.builder().otpAgeInSeconds(ChangePassOtp.OTP_AGE).build();
    }

    @Override
    public VerifyEmailResponse verifyEmailByOtp(VerifyEmailRequest request) {
        return switch (OtpTypes.valueOf(request.getOtpType())) {
            case OtpTypes.REGISTER -> this.verifyEmailByRegisterOtp(request);
            case OtpTypes.LOST_PASSWORD -> this.verifyEmailByLostPassOtp(request);
            default -> throw new AppExc(ErrorCodes.OTP_TYPE_NOT_FOUND);
        };
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    public void registerNewAccount(RegisterRequest dto) {
        var department = departmentRepository.findById(dto.getDepartmentId())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
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

    @Override
    public void lostPassword(LostPassRequest dto) {
        Map<String, String> emailCustom = emailService.getMailContentCustom();
        var account = accountRepository.findByUsername(dto.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.EMAIL_NOT_FOUND));
        var userInfo = userInfoService.findByAccountUsername(account.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_CREDENTIALS));

        LostPassOtp otp = lostPassOtpCrud.findById(dto.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.OTP_NOT_FOUND));
        if (!otp.getOtp().equals(dto.getOtp()))
            throw new AppExc(ErrorCodes.OTP_NOT_CORRECT);

        String newPassword = OtpService.randOTP();
        account.setPassword(userPasswordEncoder.encode(newPassword));
        accountRepository.save(account);

        emailService.sendSimpleEmail(
            userInfo.getEmail(),
            String.format(emailCustom.get("subject"), "New Password"),
            String.format(emailCustom.get("msg"), userInfo.getEmail(), newPassword));
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    public void changePassword(String token, ChangePassRequest dto) {
        var userInfo = userInfoRepository.findByAccountUsername(token)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
        var account = userInfo.getAccount();

        account.setPassword(userPasswordEncoder.encode(dto.getPassword()));
        accountRepository.save(account);
    }

    private VerifyEmailResponse verifyEmailByRegisterOtp(VerifyEmailRequest request) {
        Map<String, String> mailCustom = emailService.getMailContentCustom();
        String otp = OtpService.randOTP();

        if (userInfoService.existsByEmail(request.getEmail()))
            throw new AppExc(ErrorCodes.DUPLICATED_EMAIL);
        if (registerOtpCrud.existsById(request.getEmail()))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);
        registerOtpCrud.save(RegisterOtp.builder()
            .email(request.getEmail())
            .otp(otp)
            .build());
        emailService.sendSimpleEmail(
            request.getEmail(),
            String.format(mailCustom.get("subject"), "Register OTP"),
            String.format(mailCustom.get("msg"), request.getEmail(), otp));
        return VerifyEmailResponse.builder().otpAgeInSeconds(RegisterOtp.OTP_AGE).build();
    }

    private VerifyEmailResponse verifyEmailByLostPassOtp(VerifyEmailRequest request) {
        Map<String, String> mailCustom = emailService.getMailContentCustom();
        String otp = OtpService.randOTP();

        if (!userInfoService.existsByEmail(request.getEmail()))
            throw new AppExc(ErrorCodes.EMAIL_NOT_FOUND);
        if (lostPassOtpCrud.existsById(request.getEmail()))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);
        lostPassOtpCrud.save(LostPassOtp.builder()
            .email(request.getEmail())
            .otp(otp)
            .build());
        emailService.sendSimpleEmail(
            request.getEmail(),
            String.format(mailCustom.get("subject"), "Lost Password OTP"),
            String.format(mailCustom.get("msg"), request.getEmail(), otp));
        return VerifyEmailResponse.builder().otpAgeInSeconds(LostPassOtp.OTP_AGE).build();
    }
}
