package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.GroupRole;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.model.GroupHasUsers;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.GroupHasUsersRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class GroupHasUsersService {
    GroupHasUsersRepository groupUserRepository;
    UserInfoService userInfoService;

    public Page<Group> findAllRelatedGroups(String email, String query, Pageable pageable) {
        return groupUserRepository.findAllRelatedGroups(email, query, pageable);
    }

    public List<GroupHasUsers> saveAll(List<GroupHasUsers> groupHasUsers) {
        return groupUserRepository.saveAll(groupHasUsers);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public void update(Long id, GroupRole role, String token) {
        var curUser = userInfoService.getUserInfo(token);
        var changedGroupUser = groupUserRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (this.isNotAdminOnGroup(curUser.getEmail()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isEmployee = changedGroupUser.getJoinedUserInfo()
            .getAccount().getAuthorities().getFirst().getAuthority()
            .equals(AuthorityEnum.ROLE_EMP.toString());
        if (role.equals(GroupRole.ADMIN) && isEmployee)
            throw new AppExc(ErrorCodes.EMP_CANT_BE_ADMIN);

        changedGroupUser.setRole(role);
        groupUserRepository.save(changedGroupUser);
    }

    public void kickUser(Long id, String token) {
        this.updateGroupUserStatus(id, token, false);
    }

    public void reAddUser(Long id, String token) {
        this.updateGroupUserStatus(id, token, true);
    }

    public boolean isNotAdminOnGroup(String userEmailOnGroup) {
        var currentUserInGroup = groupUserRepository.findByJoinedUserInfoEmail(userEmailOnGroup)
            .orElseThrow(() -> new AppExc(ErrorCodes.FORBIDDEN_USER));
        return !currentUserInGroup.getRole().equals(GroupRole.ADMIN);
    }

    public List<Group> findAllRelatedToUser(String username) {
        return groupUserRepository.findAllRelatedToUser(username);
    }

    public List<UserInfo> getUsersGroupToAssign(String id, String username) {
        return groupUserRepository.findAllUsersGroupToAssign(id, username);
    }

    public void updateGroupUserStatus(Long groupId, String token, boolean status) {
        var curUser = userInfoService.getUserInfo(token);
        var kickedGroupUser = groupUserRepository.findById(groupId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (this.isNotAdminOnGroup(curUser.getEmail()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        if (kickedGroupUser.getJoinedUserInfo().getEmail().equals(curUser.getEmail()))
            throw new AppExc(ErrorCodes.CANT_KICK_YOURSELF);

        kickedGroupUser.setActive(status);
        groupUserRepository.save(kickedGroupUser);
    }
}
