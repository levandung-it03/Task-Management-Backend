package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Component
@NoArgsConstructor
public class TaskForUsersMapper {

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public ShortUserInfoDTO shortenTaskUserResponse(UserInfo userInfo) {
        return ShortUserInfoDTO.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .department(userInfo.getDepartment().getName())
            .build();
    }
}
