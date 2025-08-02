package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.jpa.model.enums.GroupRole;
import com.ptithcm.intern_project.dto.response.GroupUserResponse;
import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.model.GroupHasUsers;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class GroupHasUserMapper {
    UserInfoMapper userInfoMapper;

    public GroupUserResponse toResponse(GroupHasUsers groupHasUsers) {
        return GroupUserResponse.builder()
            .id(groupHasUsers.getId())
            .role(groupHasUsers.getRole())
            .joinedUser(userInfoMapper.shortenUserInfo(groupHasUsers.getJoinedUserInfo()))
            .involvedTime(groupHasUsers.getInvolvedTime())
            .build();
    }

    public GroupHasUsers newMemberModel(Group group, UserInfo joinedUser) {
        return this.newModel(group, joinedUser, GroupRole.MEMBER);
    }

    public GroupHasUsers newAdminModel(Group group, UserInfo joinedUser) {
        return this.newModel(group, joinedUser, GroupRole.ADMIN);
    }

    public GroupHasUsers newModel(Group group, UserInfo joinedUser, GroupRole role) {
        return GroupHasUsers.builder()
            .group(group)
            .role(role)
            .joinedUserInfo(joinedUser)
            .active(true)
            .involvedTime(LocalDateTime.now())
            .build();
    }
}
