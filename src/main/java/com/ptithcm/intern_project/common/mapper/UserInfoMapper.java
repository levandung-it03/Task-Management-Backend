package com.ptithcm.intern_project.common.mapper;

import com.ptithcm.intern_project.dto.response.ShortUserInfoResponse;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@NoArgsConstructor
public class UserInfoMapper {

    public ShortUserInfoResponse shortenUserInfo(UserInfo userInfo) {
        return ShortUserInfoResponse.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .build();
    }
}
