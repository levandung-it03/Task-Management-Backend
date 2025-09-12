package com.ptithcm.intern_project.service.cache;

import com.ptithcm.intern_project.model.cache.InvalidToken;
import com.ptithcm.intern_project.repository.InvalidTokenCrud;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InvalidTokenService {
    InvalidTokenCrud invalidTokenCrud;

    public void save(InvalidToken tokenInfo) {
        invalidTokenCrud.save(tokenInfo);
    }
}
