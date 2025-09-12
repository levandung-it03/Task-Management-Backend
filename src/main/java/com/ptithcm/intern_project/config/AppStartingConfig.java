package com.ptithcm.intern_project.config;

import com.ptithcm.intern_project.repository.*;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AppStartingConfig implements CommandLineRunner {
    AuthorizedEmailOtpCrud authorizedEmailOtpCrud;
    LostPassOtpCrud lostPassOtpCrud;
    InvalidTokenCrud invalidTokenCrud;
    RefreshTokenCrud refreshTokenCrud;
    RegisterOtpCrud registerOtpCrud;

    @Override
    public void run(String... args) {
        authorizedEmailOtpCrud.deleteAll();
        lostPassOtpCrud.deleteAll();
        invalidTokenCrud.deleteAll();
        refreshTokenCrud.deleteAll();
        registerOtpCrud.deleteAll();
    }
}
