package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import com.ptithcm.intern_project.service.AccountService;
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
            content = @Content(schema = @Schema(implementation = RestApiResponse.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=[10001, 10002]; message=Invalid variable type or format of fields",
            content = @Content(schema = @Schema(implementation = RestApiResponse.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=11000, message=User not found or access denied",
            content = @Content(schema = @Schema(implementation = RestApiResponse.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=11001, message=Invalid Credentials",
            content = @Content(schema = @Schema(implementation = RestApiResponse.class))),
        @ApiResponse(
            responseCode = "400",
            description = "code=10000; message=Unaware exception's thrown from resource server",
            content = @Content(schema = @Schema(implementation = RestApiResponse.class))),
    })
    @ResponseBody
    @PostMapping("/public/auth/account/v1/authenticate")
    public ResponseEntity<RestApiResponse<AuthResponse>> authenticate(@Valid @RequestBody AuthRequest dto) {
        return RestApiResponse.fromScs(AUTHENTICATE, accountService.authenticate(dto));
    }

    @ResponseBody
    @PostMapping("/private/auth/account/v1/refresh-token")
    public ResponseEntity<RestApiResponse<TokenDTO>> refreshToken(
        @RequestHeader("Authorization") String refreshToken,
        @Valid @RequestBody TokenDTO dto) {
        return RestApiResponse.fromScs(REFRESH_TOKEN, accountService.refreshToken(refreshToken, dto.getAccessToken()));
    }

    @ResponseBody
    @PostMapping("/private/auth/account/v1/log-out")
    public ResponseEntity<RestApiResponse<Void>> logout(
        @RequestHeader("Authorization") String refreshToken,
        @Valid @RequestBody TokenDTO dto) {
        accountService.logout(refreshToken, dto.getAccessToken());
        return RestApiResponse.fromScs(LOGOUT);
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/verify-email")
    public ResponseEntity<RestApiResponse<VerifyEmailResponse>> verifyEmailByOtp(
        @Valid @RequestBody VerifyEmailRequest dto) {
        return RestApiResponse.fromScs(GET_OTP, accountService.verifyEmailByOtp(dto));
    }

    @ResponseBody
    @PostMapping({"/private/user/account/v1/authorize-email", "/private/admin/account/v1/authorize-email"})
    public ResponseEntity<RestApiResponse<VerifyEmailResponse>> authorizeEmailByOtp(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_OTP, accountService.authorizeEmailByOtp(token));
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/register")
    public ResponseEntity<RestApiResponse<Void>> registerNewAccount(@Valid @RequestBody RegisterRequest dto) {
        accountService.registerNewAccount(dto);
        return RestApiResponse.fromScs(REGISTER);
    }

    @ResponseBody
    @PostMapping("/public/auth/account/v1/lost-password")
    public ResponseEntity<RestApiResponse<Void>> lostPassword(@Valid @RequestBody LostPassRequest dto) {
        accountService.lostPassword(dto);
        return RestApiResponse.fromScs(LOST_PASSWORD);
    }

    @ResponseBody
    @PutMapping({"/private/user/account/v1/change-password", "/private/admin/account/v1/change-password"})
    public ResponseEntity<RestApiResponse<Void>> changePassword(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody ChangePassRequest dto) {
        accountService.changePassword(token, dto);
        return RestApiResponse.fromScs(LOST_PASSWORD);
    }
}
