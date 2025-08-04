package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.general.TokenDTO;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.AuthResponse;
import com.ptithcm.intern_project.dto.response.EmailResponse;
import com.ptithcm.intern_project.dto.response.VerifyEmailResponse;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface IAccountService {
    AuthResponse authenticate(AuthRequest dto);

    TokenDTO refreshToken(String refreshToken, String accessToken);

    void logout(String refreshToken, String accessToken);

    VerifyEmailResponse authorizeEmailByOtp(String token);

    VerifyEmailResponse verifyEmailByOtp(VerifyEmailRequest dto);

    void registerNewAccount(RegisterRequest dto);

    void lostPassword(LostPassRequest dto);

    void changePassword(String token, ChangePassRequest dto);

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    EmailResponse getEmail(String token);
}
