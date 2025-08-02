package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Component
@NoArgsConstructor
public class TaskForUsersMapper {

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public ShortUserInfoDTO shortenTaskUserResponse(TaskForUsers taskForUsers) {
        return ShortUserInfoDTO.builder()
            .email(taskForUsers.getAssignedUser().getEmail())
            .fullName(taskForUsers.getAssignedUser().getFullName())
            .role(taskForUsers.getAssignedUser().getAccount().getAuthorities().getFirst().getAuthority())
            .build();
    }
}
