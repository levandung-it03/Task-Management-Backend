package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.dto.response.GroupResponse;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.dto.response.ShortGroupResponse;
import com.ptithcm.intern_project.model.Group;
import com.ptithcm.intern_project.model.GroupHasUsers;
import com.ptithcm.intern_project.model.UserInfo;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class GroupMapper {

    public GroupResponse toResponse(Group group) {
        var userCreatedRole = group
            .getUserInfoCreated()
            .getAccount().getAuthorities().getFirst().getAuthority();
        var shortUserInfo = ShortUserInfoDTO.builder()
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
            .active(group.isActive())
            .build();
    }

    public Group newModel(String name, UserInfo userCreated) {
        return Group.builder()
            .name(name)
            .userInfoCreated(userCreated)
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .active(true)
            .build();
    }

    public ShortGroupResponse shortenGroup(Group group, GroupHasUsers userGroup) {
        return ShortGroupResponse.builder()
            .id(group.getId())
            .name(group.getName())
            .role(userGroup.getRole())
            .build();
    }
}
