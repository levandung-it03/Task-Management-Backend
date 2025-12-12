package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.*;
import com.ptithcm.intern_project.model.dto.general.*;
import com.ptithcm.intern_project.model.dto.request.*;
import com.ptithcm.intern_project.model.dto.response.EmailResponse;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.mapper.AccountMapper;
import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.model.cache.*;
import com.ptithcm.intern_project.repository.*;
import com.ptithcm.intern_project.model.dto.response.AuthResponse;
import com.ptithcm.intern_project.model.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.config.enums.OtpTypes;
import com.ptithcm.intern_project.config.enums.TokenClaimNames;
import com.ptithcm.intern_project.config.enums.TokenTypes;
import com.ptithcm.intern_project.service.auth.JwtService;
import com.ptithcm.intern_project.service.auth.OtpHelper;
import com.ptithcm.intern_project.service.cache.*;
import com.ptithcm.intern_project.service.files.AccountDataService;
import com.ptithcm.intern_project.service.interfaces.IAccountService;
import com.ptithcm.intern_project.service.email.messages.AccountMsg;
import com.ptithcm.intern_project.service.email.EmailService;
import com.ptithcm.intern_project.service.files.ExcelHelper;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@EnableAspectJAutoProxy(exposeProxy = true)
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AccountService implements IAccountService {
    AccountRepository accountRepository;
    AuthorityService authorityService;
    InvalidTokenService invalidTokenService;
    RefreshTokenService refreshTokenService;
    JwtService jwtService;
    PasswordEncoder userPasswordEncoder;
    EmailService emailService;
    RegisterOtpService registerOtpService;
    LostPassOtpService lostPassOtpService;
    AuthorizeEmailOtpService authorizedEmailOtpService;
    DepartmentService departmentService;
    UserInfoService userInfoService;
    AccountMapper accountMapper;
    AccountDataService accountDataService;

    @Override
    public AuthResponse authenticate(AuthRequest dto) {
        Account authAccount = accountRepository.findByUsername(dto.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_CREDENTIALS));

        if (!userPasswordEncoder.matches(dto.getPassword(), authAccount.getPassword()))
            throw new AppExc(ErrorCodes.INVALID_CREDENTIALS);

        if (!authAccount.isStatus())
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        UserInfo userInfo = userInfoService.findByAccountId(authAccount.getId())
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

        refreshTokenService.save(RefreshToken.builder().id(refreshTokenInfoDTO.getJti()).build());
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

        UserInfo userInfo = userInfoService.findByAccountId(authAccount.getId())
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

        refreshTokenService.deleteById(refreshClaims.get("jti"));
        if (new Date(System.currentTimeMillis()).before(new Date(exp)))
            invalidTokenService.save(InvalidToken.builder()
                .id(accessClaims.get("jti"))
                .expiryDate(new Date(exp).toInstant())
                .build());
    }

    @Override
    public VerifyEmailResponse authorizeLoggingInEmail(String token) {
        UserInfo userInfo = userInfoService.getUserInfo(token);

        if (authorizedEmailOtpService.existsById(userInfo.getEmail()))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);

        String otp = OtpHelper.randOTP();
        authorizedEmailOtpService.save(AuthorizedEmailOtp.builder()
            .email(userInfo.getEmail())
            .otp(otp)
            .build());

        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(userInfo.getEmail())
            .subject(AccountMsg.AUTH_EMAIL_OTP_MSG.getSubject())
            .body(AccountMsg.AUTH_EMAIL_OTP_MSG.format(userInfo.getEmail(), otp))
            .build());
        return VerifyEmailResponse.builder().otpAgeInSeconds(AuthorizedEmailOtp.OTP_AGE).build();
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
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void registerNewAccount(RegisterRequest dto) {
        var foundOtp = registerOtpService.findById(dto.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.OTP_NOT_FOUND));
        if (!foundOtp.getOtp().equals(dto.getOtp()))
            throw new AppExc(ErrorCodes.OTP_NOT_CORRECT);

        var department = departmentService.findById(dto.getDepartmentId());
        var authorities = List.of(authorityService.findByEnumStr(AuthorityEnum.ROLE_PM));
        var savedAccount = accountRepository.save(Account.builder()
            .authorities(authorities)
            .username(dto.getUsername())
            .password(userPasswordEncoder.encode(dto.getPassword()))
            .status(true)
            .createdTime(LocalDateTime.now(ZoneId.systemDefault()))
            .updatedTime(LocalDateTime.now(ZoneId.systemDefault()))
            .build());
        userInfoService.save(UserInfo.builder()
            .email(dto.getEmail())
            .identity(dto.getIdentity())
            .phone(dto.getPhone())
            .department(department)
            .fullName(dto.getFullName())
            .account(savedAccount)
            .build());
        registerOtpService.deleteById(dto.getEmail());
    }

    @Override
    public void lostPassword(LostPassRequest dto) {
        var account = accountRepository.findByUsername(dto.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.EMAIL_NOT_FOUND));
        var userInfo = userInfoService.findByAccountUsername(account.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_CREDENTIALS));

        LostPassOtp otp = lostPassOtpService.findById(userInfo.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.OTP_NOT_FOUND));
        if (!otp.getOtp().equals(dto.getOtp()))
            throw new AppExc(ErrorCodes.OTP_NOT_CORRECT);

        String newPassword = OtpHelper.randOTP();
        account.setPassword(userPasswordEncoder.encode(newPassword));
        accountRepository.save(account);

        lostPassOtpService.deleteById(userInfo.getEmail());

        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(userInfo.getEmail())
            .subject(AccountMsg.NEW_PASS_OTP_MSG.getSubject())
            .body(AccountMsg.NEW_PASS_OTP_MSG.format(userInfo.getEmail(), otp))
            .build());
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void changePassword(String token, ChangePassRequest dto) {
        var username = jwtService.readPayload(token).get("sub");
        var userInfo = userInfoService.findByAccountUsername(username)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        System.out.println(userInfo.getEmail());
        AuthorizedEmailOtp otp = authorizedEmailOtpService.findById(userInfo.getEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.OTP_NOT_FOUND));
        if (!otp.getOtp().equals(dto.getOtp()))
            throw new AppExc(ErrorCodes.OTP_NOT_CORRECT);

        authorizedEmailOtpService.deleteById(userInfo.getEmail());
        userInfo.getAccount().setPassword(userPasswordEncoder.encode(dto.getPassword()));
        accountRepository.save(userInfo.getAccount());
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public EmailResponse getEmail(String token) {
        var userInfo = userInfoService.getUserInfo(token);
        return EmailResponse.builder().email(userInfo.getEmail()).build();
    }

    private VerifyEmailResponse verifyEmailByRegisterOtp(VerifyEmailRequest request) {
        String otp = OtpHelper.randOTP();

        if (userInfoService.existsByEmail(request.getEmail()))
            throw new AppExc(ErrorCodes.DUPLICATED_EMAIL);
        if (registerOtpService.existsById(request.getEmail()))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);
        registerOtpService.save(RegisterOtp.builder()
            .email(request.getEmail())
            .otp(otp)
            .build());

        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(request.getEmail())
            .subject(AccountMsg.REGISTER_OTP_MSG.getSubject())
            .body(AccountMsg.REGISTER_OTP_MSG.format(request.getEmail(), otp))
            .build());
        return VerifyEmailResponse.builder().otpAgeInSeconds(RegisterOtp.OTP_AGE).build();
    }

    private VerifyEmailResponse verifyEmailByLostPassOtp(VerifyEmailRequest request) {
        String otp = OtpHelper.randOTP();

        if (!userInfoService.existsByEmail(request.getEmail()))
            throw new AppExc(ErrorCodes.EMAIL_NOT_FOUND);
        if (lostPassOtpService.existsById(request.getEmail()))
            throw new AppExc(ErrorCodes.OTP_HAS_NOT_EXPIRED);
        lostPassOtpService.save(LostPassOtp.builder()
            .email(request.getEmail())
            .otp(otp)
            .build());

        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(request.getEmail())
            .subject(AccountMsg.LOST_PASS_OTP_MSG.getSubject())
            .body(AccountMsg.LOST_PASS_OTP_MSG.format())
            .build());
        return VerifyEmailResponse.builder().otpAgeInSeconds(LostPassOtp.OTP_AGE).build();
    }

    public void switchAccountActive(Long accountId) {
        var account = accountRepository.findById(accountId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        account.setStatus(!account.isStatus());
        account.setUpdatedTime(LocalDateTime.now());
        accountRepository.save(account);

        var userInfo = userInfoService
            .findByAccountUsername(account.getUsername())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_CREDENTIALS));

        var accountMsgEnum = account.isStatus()
            ? AccountMsg.STATUS_UPDATED_TRUE
            : AccountMsg.STATUS_UPDATED_FALSE;
        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(userInfo.getEmail())
            .subject(accountMsgEnum.getSubject())
            .body(accountMsgEnum.format())
            .build());
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<IdResponse> createAccounts(MultipartFile file) {
        Object[][] accountInfo = ExcelHelper.readExcel(file);
        HashMap<String, Integer> colIdxMap = new HashMap<>();
        for (int i = 0; i < accountInfo[0].length; i++)
            if (accountInfo[0][i] != null)  colIdxMap.put(accountInfo[0][i].toString(), i);

        Map<AuthorityEnum, Authority> authorityMap = authorityService.findAll().stream()
            .collect(Collectors.toMap(
                auth -> AuthorityEnum.valueOf(auth.getName()),
                auth -> auth));
        Map<Long, Department> departments = departmentService.findAll().stream()
            .collect(Collectors.toMap(Department::getId, dep -> dep));
        List<UserInfo> usersInfoRequest = new ArrayList<>();
        List<AccountCreationDTO> responses = new ArrayList<>();

        for (int row = 1; row < accountInfo.length; row++) {
            var registerReq = accountMapper.toRegisterRequest(accountInfo[row], colIdxMap);
            responses.add(registerReq);

            var account = Account.builder()
                .username(registerReq.getUsername())
                .password(userPasswordEncoder.encode(registerReq.getPassword()))
                .authorities(List.of(authorityMap.get(registerReq.getAuthority())))
                .createdTime(LocalDateTime.now())
                .updatedTime(LocalDateTime.now())
                .status(true)
                .build();
            usersInfoRequest.add(UserInfo.builder()
                .account(account)
                .email(registerReq.getEmail())
                .department(departments.get(registerReq.getDepartmentId()))
                .fullName(registerReq.getFullName())
                .phone(registerReq.getPhone())
                .identity(registerReq.getIdentity())
                .build());
        }
        var savedUsers = userInfoService.saveAll(usersInfoRequest);
        accountDataService.saveCreatedAccountsIntoServer(responses);
        return savedUsers.stream().map(user -> IdResponse.builder().id(user.getId()).build()).toList();
    }

}
