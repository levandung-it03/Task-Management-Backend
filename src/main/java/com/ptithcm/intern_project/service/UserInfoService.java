package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.annotation.constraint.ListTypeConstraint;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.UserInfoRepository;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserInfoService {
    UserInfoRepository userInfoRepository;
    JwtService jwtService;

    public UserInfo getUserInfo(String token) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        return userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
    }

    public void updateUserInfo(String token, UpdatedUserInfoRequest dto) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        UserInfo originInfo = userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        originInfo.setFullName(dto.getFullName());
        originInfo.setDob(dto.getDob());
        userInfoRepository.save(originInfo);
    }

    public List<UserInfo> findAllByEmailIn(List<String> assignedEmails) {
        return userInfoRepository.findAllByEmailIn(assignedEmails);
    }
}
