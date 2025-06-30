package com.ptithcm.intern_project.controllers;

import com.ptithcm.intern_project.common.wrappers.ApiResponseObject;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.services.AccountService;
import static com.ptithcm.intern_project.common.enums.SuccessCodes.*;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AccountController {
    AccountService accountService;

    @Operation(summary = "Authenticate Account credentials")
    @ApiResponses(value = {
        @ApiResponse(
            responseCode = "200",
            description = "code=23001; message=Create new Exercise successfully",
            content = @Content(schema = @Schema(implementation = ApiResponseObject.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=[10001, 10002]; message=Invalid variable type or format of fields",
            content = @Content(schema = @Schema(implementation = ApiResponseObject.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=11000, message=User not found or access denied",
            content = @Content(schema = @Schema(implementation = ApiResponseObject.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=11001, message=Invalid Credentials",
            content = @Content(schema = @Schema(implementation = ApiResponseObject.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=10000; message=Unaware exception's thrown from resource server",
            content = @Content(schema = @Schema(implementation = ApiResponseObject.class))),
    })
    @ResponseBody
    @PostMapping("/public/auth/account/v1/authenticate")
    public ResponseEntity<ApiResponseObject<AuthResponse>> authenticate(@Valid @RequestBody AuthRequestDTO dto) {
        return ApiResponseObject.fromScs(AUTHENTICATE, accountService.authenticate(dto));
    }

    @ResponseBody
    @PostMapping("/private/auth/account/v1/refresh-token")
    public ResponseEntity<ApiResponseObject<TokenDTO>> refreshToken(
        @RequestHeader("Authorization") String refreshToken,
        @Valid @RequestBody TokenDTO dto) {
        return ApiResponseObject.fromScs(REFRESH_TOKEN, accountService.refreshToken(refreshToken, dto.getAccessToken()));
    }

    @ResponseBody
    @PostMapping("/private/auth/account/v1/log-out")
    public ResponseEntity<ApiResponseObject<Void>> logout(
        @RequestHeader("Authorization") String refreshToken,
        @Valid @RequestBody TokenDTO dto) {
        accountService.logout(refreshToken, dto.getAccessToken());
        return ApiResponseObject.fromScs(LOGOUT);
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/verify-email")
    public ResponseEntity<ApiResponseObject<VerifyEmailResponse>> verifyEmailByOtp(
        @Valid @RequestBody VerifyEmailRequestDTO dto) {
        return ApiResponseObject.fromScs(GET_OTP, accountService.verifyEmailByOtp(dto));
    }

    @ResponseBody
    @PostMapping({"/private/user/account/v1/authorize-email", "/private/admin/account/v1/authorize-email"})
    public ResponseEntity<ApiResponseObject<VerifyEmailResponse>> authorizeEmailByOtp(
        @RequestHeader("Authorization") String token) {
        return ApiResponseObject.fromScs(GET_OTP, accountService.authorizeEmailByOtp(token));
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/register")
    public ResponseEntity<ApiResponseObject<Void>> registerNewAccount(@Valid @RequestBody RegisterRequestDTO dto) {
        accountService.registerNewAccount(dto);
        return ApiResponseObject.fromScs(REGISTER);
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/lost-password")
    public ResponseEntity<ApiResponseObject<Void>> lostPassword(@Valid @RequestBody LostPassRequestDTO dto) {
        accountService.lostPassword(dto);
        return ApiResponseObject.fromScs(LOST_PASSWORD);
    }

    @ResponseBody
    @PutMapping({"/private/user/account/v1/change-password", "/private/admin/account/v1/change-password"})
    public ResponseEntity<ApiResponseObject<Void>> changePassword(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody ChangePassRequestDTO dto) {
        accountService.changePassword(token, dto);
        return ApiResponseObject.fromScs(LOST_PASSWORD);
    }
}
