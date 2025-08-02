package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.general.TokenDTO;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.service.AccountService;
import static com.ptithcm.intern_project.exception.enums.SuccessCodes.*;

import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AccountController {
    AccountService accountService;

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
    @PostMapping("/private/" + ROLE_AUTH + "/v1/account/authorize-email")
    public ResponseEntity<RestApiResponse<VerifyEmailResponse>> authorizeEmailByOtp(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_OTP, accountService.authorizeEmailByOtp(token));
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
    @PutMapping("/private/v1/account/change-password")
    public ResponseEntity<RestApiResponse<Void>> changePassword(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody ChangePassRequest dto) {
        accountService.changePassword(token, dto);
        return RestApiResponse.fromScs(LOST_PASSWORD);
    }
}
