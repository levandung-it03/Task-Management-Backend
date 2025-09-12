package com.ptithcm.intern_project.service.cache;

import com.ptithcm.intern_project.model.cache.LostPassOtp;
import com.ptithcm.intern_project.repository.LostPassOtpCrud;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class LostPassOtpService {
    LostPassOtpCrud lostPassOtpCrud;

    public Optional<LostPassOtp> findById(String email) {
        return lostPassOtpCrud.findById(email);
    }

    public void deleteById(String email) {
        lostPassOtpCrud.deleteById(email);
    }

    public boolean existsById(String email) {
        return lostPassOtpCrud.existsById(email);
    }

    public void save(LostPassOtp build) {
        lostPassOtpCrud.save(build);
    }
}
