package com.ptithcm.intern_project.service.cache;

import com.ptithcm.intern_project.model.cache.RegisterOtp;
import com.ptithcm.intern_project.repository.RegisterOtpCrud;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RegisterOtpService {
    RegisterOtpCrud registerOtpCrud;

    public Optional<RegisterOtp> findById(String email) {
        return registerOtpCrud.findById(email);
    }

    public void deleteById(String email) {
        registerOtpCrud.deleteById(email);
    }

    public boolean existsById(String email) {
        return registerOtpCrud.existsById(email);
    }

    public void save(RegisterOtp otpInfo) {
        registerOtpCrud.save(otpInfo);
    }
}
