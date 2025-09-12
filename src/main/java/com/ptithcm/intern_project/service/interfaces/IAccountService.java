package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.request.*;
import com.ptithcm.intern_project.model.dto.general.TokenDTO;
import com.ptithcm.intern_project.model.dto.response.AuthResponse;
import com.ptithcm.intern_project.model.dto.response.EmailResponse;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.dto.response.VerifyEmailResponse;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface IAccountService {
    AuthResponse authenticate(AuthRequest dto);

    TokenDTO refreshToken(String refreshToken, String accessToken);

    void logout(String refreshToken, String accessToken);

    VerifyEmailResponse authorizeLoggingInEmail(String token);

    VerifyEmailResponse verifyEmailByOtp(VerifyEmailRequest dto);

    void registerNewAccount(RegisterRequest dto);

    void lostPassword(LostPassRequest dto);

    void changePassword(String token, ChangePassRequest dto);

    EmailResponse getEmail(String token);

    List<IdResponse> createAccounts(MultipartFile file);

    Resource getAccountCreationExample();

    Map<String, Boolean> checkExistsCachedCreatedAccounts();

    Resource getCachedAccountCreation();

    void clearCachedAccountCreation();
}
