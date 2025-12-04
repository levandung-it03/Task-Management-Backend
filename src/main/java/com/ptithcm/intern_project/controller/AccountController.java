package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.dto.request.*;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import com.ptithcm.intern_project.model.dto.general.TokenDTO;
import com.ptithcm.intern_project.model.dto.response.AuthResponse;
import com.ptithcm.intern_project.model.dto.response.EmailResponse;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.service.AccountService;

import com.ptithcm.intern_project.service.files.AccountDataService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

import static com.ptithcm.intern_project.config.enums.SuccessCodes.*;
import static com.ptithcm.intern_project.config.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AccountController {
    AccountService accountService;
    AccountDataService accountDataSvc;

    @Operation(summary = "Authenticate Account credentials")
    @PostMapping("/public/v1/account/authenticate")
    public ResponseEntity<RestApiResponse<AuthResponse>> authenticate(@Valid @RequestBody AuthRequest dto) {
        return RestApiResponse.fromScs(AUTHENTICATE, accountService.authenticate(dto));
    }

    @Operation(summary = "Refresh JWT Token")
    @PostMapping("/private/" + ROLE_AUTH + "/v1/account/refresh-token")
    public ResponseEntity<RestApiResponse<TokenDTO>> refreshToken(
        @RequestHeader("Authorization") String refreshToken,
        @Valid @RequestBody TokenDTO dto) {
        return RestApiResponse.fromScs(REFRESH_TOKEN, accountService.refreshToken(refreshToken, dto.getAccessToken()));
    }

    @Operation(summary = "Log-out by killing JWT Token")
    @PostMapping("/private/" + ROLE_AUTH + "/v1/account/log-out")
    public ResponseEntity<RestApiResponse<Void>> logout(
        @RequestHeader("Authorization") String refreshToken,
        @Valid @RequestBody TokenDTO dto) {
        accountService.logout(refreshToken, dto.getAccessToken());
        return RestApiResponse.fromScs(LOGOUT);
    }

    @Operation(description = "Generally verify a valid email, by OTP")
    @PostMapping("/public/v1/account/verify-email")
    public ResponseEntity<RestApiResponse<VerifyEmailResponse>> verifyEmailByOtp(
        @Valid @RequestBody VerifyEmailRequest dto) {
        return RestApiResponse.fromScs(GET_OTP, accountService.verifyEmailByOtp(dto));
    }

    @Operation(description = "Generally authorize an existing email, by OTP")
    @PostMapping({
        "/private/" + ROLE_ADMIN + "/v1/account/authorize-email",
        "/private/" + ROLE_PM + "/v1/account/authorize-email",
        "/private/" + ROLE_LEAD + "/v1/account/authorize-email",
        "/private/" + ROLE_EMP + "/v1/account/authorize-email",})
    public ResponseEntity<RestApiResponse<VerifyEmailResponse>> authorizeLoggingInEmail(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_OTP, accountService.authorizeLoggingInEmail(token));
    }

    @Operation(description = "Register an Account (may be used for creating ADMIN)")
    @PostMapping("/public/v1/account/register")
    public ResponseEntity<RestApiResponse<Void>> registerNewAccount(@Valid @RequestBody RegisterRequest dto) {
        accountService.registerNewAccount(dto);
        return RestApiResponse.fromScs(REGISTER);
    }

    @Operation(description = "Generate a new random password for User (will be sent via email after)")
    @PostMapping("/public/v1/account/lost-password")
    public ResponseEntity<RestApiResponse<Void>> lostPassword(@Valid @RequestBody LostPassRequest dto) {
        accountService.lostPassword(dto);
        return RestApiResponse.fromScs(LOST_PASSWORD);
    }

    @Operation(description = "Pro-actively change password by user")
    @PutMapping({
        "/private/" + ROLE_ADMIN + "/v1/account/change-password",
        "/private/" + ROLE_PM + "/v1/account/change-password",
        "/private/" + ROLE_LEAD + "/v1/account/change-password",
        "/private/" + ROLE_EMP + "/v1/account/change-password"})
    public ResponseEntity<RestApiResponse<Void>> changePassword(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody ChangePassRequest dto) {
        accountService.changePassword(token, dto);
        return RestApiResponse.fromScs(LOST_PASSWORD);
    }

    @Operation(description = "Get email to verify permissions")
    @GetMapping({
        "/private/" + ROLE_ADMIN + "/v1/account/email",
        "/private/" + ROLE_PM + "/v1/account/email",
        "/private/" + ROLE_LEAD + "/v1/account/email",
        "/private/" + ROLE_EMP + "/v1/account/email",})
    public ResponseEntity<RestApiResponse<EmailResponse>> getEmail(@RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_DETAIL, accountService.getEmail(token));
    }

    @Operation(description = "Switch specified Account active status")
    @PutMapping("/private/" + ROLE_ADMIN + "/v1/account/{id}/switch-status")
    public ResponseEntity<RestApiResponse<Void>> switchAccountStatus(
        @PathVariable("id") Long accountId) {
        accountService.switchAccountActive(accountId);
        return RestApiResponse.fromScs(UPDATED);
    }

    @Operation(description = "Receiving file as format to create Accounts")
    @PostMapping("/private/" + ROLE_ADMIN + "/v1/account/create-accounts")
    public ResponseEntity<RestApiResponse<List<IdResponse>>> createAccounts(
        @RequestParam("file") MultipartFile file) {
        return RestApiResponse.fromScs(
            CREATED_ACCOUNTS, String.format(CREATED_ACCOUNTS.getMsg(), accountDataSvc.getExpiredCachedAccountsMinutes()),
            accountService.createAccounts(file));
    }

    @Operation(description = "Get the example file about create Accounts with .xlsx")
    @GetMapping("/private/" + ROLE_ADMIN + "/v1/account/accounts-creation-example")
    public ResponseEntity<Resource> getAccountCreationExample() {
        return ResponseEntity.ok()
            .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
            .header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + accountDataSvc.getAccountInfoCreationExFile() + "\"")
            .body(accountDataSvc.getAccountCreationExample());
    }

    @Operation(description = "Check if server is storing temp latest created Accounts")
    @GetMapping("/private/" + ROLE_ADMIN + "/v1/account/exists-cached-created-accounts")
    public ResponseEntity<RestApiResponse<Map<String, Boolean>>> checkExistsCachedCreatedAccounts() {
        return RestApiResponse.fromScs(GET_DETAIL, accountDataSvc.checkExistsCachedCreatedAccounts());
    }

    @Operation(description = "Get the created Accounts file from the last Accounts Creation")
    @GetMapping("/private/" + ROLE_ADMIN + "/v1/account/cached-accounts-creation")
    public ResponseEntity<Resource> getCachedAccountCreation() {
        return ResponseEntity.ok()
            .contentType(MediaType.TEXT_PLAIN)
            .header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment; filename=\"" + accountDataSvc.getCreatedAccountsTempFile() + "\"")
            .body(accountDataSvc.getCachedAccountCreation());
    }

    @Operation(description = "Clear created Accounts file from the last Accounts Creation")
    @DeleteMapping("/private/" + ROLE_ADMIN + "/v1/account/cached-accounts-creation")
    public ResponseEntity<RestApiResponse<Void>> clearCachedAccountCreation() {
        accountDataSvc.clearCachedAccountCreation();
        return RestApiResponse.fromScs(DELETED);
    }


    @GetMapping({
        "/private/" + ROLE_ADMIN + "/v1/account/authorities",
        "/private/" + ROLE_PM + "/v1/account/authorities",
        "/private/" + ROLE_LEAD + "/v1/account/authorities",
        "/private/" + ROLE_EMP + "/v1/account/authorities",})
    public ResponseEntity<RestApiResponse<AuthorityEnum[]>> getAuthorityEnums() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, AuthorityEnum.values());
    }

}
