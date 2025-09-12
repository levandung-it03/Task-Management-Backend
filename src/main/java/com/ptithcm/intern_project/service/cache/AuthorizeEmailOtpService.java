package com.ptithcm.intern_project.service.cache;

import com.ptithcm.intern_project.model.cache.AuthorizedEmailOtp;
import com.ptithcm.intern_project.repository.AuthorizedEmailOtpCrud;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthorizeEmailOtpService {
    AuthorizedEmailOtpCrud authorizedEmailOtpCrud;

    public boolean existsById(String email) {
        return authorizedEmailOtpCrud.existsById(email);
    }

    public void save(AuthorizedEmailOtp otpInfo) {
        authorizedEmailOtpCrud.save(otpInfo);
    }

    public Optional<AuthorizedEmailOtp> findById(String email) {
        return authorizedEmailOtpCrud.findById(email);
    }

    public void deleteById(String email) {
        authorizedEmailOtpCrud.deleteById(email);
    }
}
