package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Authority;
import com.ptithcm.intern_project.jpa.repository.AuthorityRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthorityService {
    AuthorityRepository authorityRepository;

    public Authority findByEnumStr(AuthorityEnum authorityEnum) {
        return authorityRepository.findByEnumStr(authorityEnum.toString())
            .orElseThrow(() -> new AppExc(ErrorCodes.UNAWARE_ERROR));
    }
}
