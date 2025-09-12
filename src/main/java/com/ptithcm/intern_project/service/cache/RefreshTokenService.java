package com.ptithcm.intern_project.service.cache;

import com.ptithcm.intern_project.model.cache.RefreshToken;
import com.ptithcm.intern_project.repository.RefreshTokenCrud;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RefreshTokenService {
    RefreshTokenCrud refreshTokenCrud;


    public void save(RefreshToken tokenInfo) {
        refreshTokenCrud.save(tokenInfo);
    }

    public void deleteById(String jti) {
        refreshTokenCrud.deleteById(jti);
    }
}
