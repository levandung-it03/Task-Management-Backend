package com.ptithcm.intern_project.common.mapper;

import com.ptithcm.intern_project.dto.response.GroupResponse;
import com.ptithcm.intern_project.dto.response.ShortUserInfoResponse;
import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class GroupMapper {

    public GroupResponse toResponse(Group group) {
        var userCreatedRole = group
            .getUserInfoCreated()
            .getAccount().getAuthorities().getFirst().getAuthority();
        var shortUserInfo = ShortUserInfoResponse.builder()
            .email(group.getUserInfoCreated().getEmail())
            .fullName(group.getUserInfoCreated().getFullName())
            .role(userCreatedRole)
            .build();
        return GroupResponse.builder()
            .id(group.getId())
            .name(group.getName())
            .createdByUser(shortUserInfo)
            .isActive(group.isActive())
            .createdTime(group.getCreatedTime())
            .updatedTime(group.getUpdatedTime())
            .userQuantity(group.getGroupUsers().size())
            .build();
    }

    public Group newModel(String name, UserInfo userCreated) {
        return Group.builder()
            .name(name)
            .userInfoCreated(userCreated)
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .isActive(true)
            .build();
    }
}
