package com.ptithcm.intern_project.services;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.dataJpa.entities.Authority;
import com.ptithcm.intern_project.dataJpa.repositories.AuthorityRepository;
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
            .orElseThrow(() -> new ApplicationException(ErrorCodes.UNAWARE_ERROR));
    }
}
