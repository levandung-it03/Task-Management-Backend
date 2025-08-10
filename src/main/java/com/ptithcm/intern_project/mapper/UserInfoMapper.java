package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@NoArgsConstructor
public class UserInfoMapper {

    public ShortUserInfoDTO shortenUserInfo(UserInfo userInfo) {
        return ShortUserInfoDTO.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .department(userInfo.getDepartment().getName())
            .build();
    }

    public void updateUserInfo(UserInfo originInfo, UpdatedUserInfoRequest dto) {
        originInfo.setFullName(dto.getFullName());
        originInfo.setPhone(dto.getPhone());
        originInfo.setIdentity(dto.getIdentity());
    }
}
