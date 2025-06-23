package com.ptithcm.intern_project.services;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.data_jpa.entities.UserInfo;
import com.ptithcm.intern_project.data_jpa.repositories.UserInfoRepository;
import com.ptithcm.intern_project.dto.request.DTO_UpdateUserInfo;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserInfoService {
    JwtService jwtService;
    UserInfoRepository userInfoRepository;

    public UserInfo getUserInfo(String token) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        return userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new ApplicationException(ErrorCodes.INVALID_TOKEN));
    }

    public void updateUserInfo(String token, DTO_UpdateUserInfo dto) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        UserInfo originInfo = userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new ApplicationException(ErrorCodes.INVALID_TOKEN));

        originInfo.setFullName(dto.getFullName());
        originInfo.setDob(dto.getDob());
        originInfo.setGender(UserInfo.Gender.valueOf(dto.getGender()));
        userInfoRepository.save(originInfo);
    }
}
