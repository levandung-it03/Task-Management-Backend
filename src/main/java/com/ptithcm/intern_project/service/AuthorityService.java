package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.Authority;
import com.ptithcm.intern_project.repository.AuthorityRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthorityService {
    AuthorityRepository authorityRepository;

    public Authority findByEnumStr(AuthorityEnum authorityEnum) {
        return authorityRepository.findByEnumStr(authorityEnum.toString())
            .orElseThrow(() -> new AppExc(ErrorCodes.UNAWARE_ERROR));
    }

    public List<Authority> findAll() {
        return authorityRepository.findAll();
    }
}
