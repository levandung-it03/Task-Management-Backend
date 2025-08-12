package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.jpa.model.enums.GroupRole;
import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.model.GroupHasUsers;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.GroupHasUsersRepository;
import com.ptithcm.intern_project.service.interfaces.IGroupHasUsersService;
import com.ptithcm.intern_project.service.messages.GroupMsg;
import com.ptithcm.intern_project.service.supports.EmailService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class GroupHasUsersService implements IGroupHasUsersService {
    GroupHasUsersRepository groupUserRepository;
    UserInfoService userInfoService;
    EmailService emailService;

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateGroupRole(Long id, GroupRole newRole, String token) {
        var curUser = userInfoService.getUserInfo(token);
        var changedGroupUser = groupUserRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (this.isNotAdminOnGroup(changedGroupUser.getGroup().getId(), curUser.getEmail()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isEmployee = changedGroupUser.getJoinedUserInfo()
            .getAccount().getAuthorities().getFirst().getAuthority()
            .equals(AuthorityEnum.ROLE_EMP.toString());
        if (newRole.equals(GroupRole.ADMIN) && isEmployee)
            throw new AppExc(ErrorCodes.EMP_CANT_BE_ADMIN);

        var hasNoAdminOnTheRestRelationships = changedGroupUser.getGroup()
            .getGroupUsers().stream()
            .filter(userGroup -> !userGroup.getJoinedUserInfo().getEmail().equals(curUser.getEmail()))
            .filter(userGroup -> userGroup.getRole().equals(GroupRole.ADMIN))
            .findFirst()
            .orElse(null) == null;
        if (hasNoAdminOnTheRestRelationships && newRole.equals(GroupRole.MEMBER))
            throw new AppExc(ErrorCodes.AT_LEAST_ONE_ADMIN);

        changedGroupUser.setRole(newRole);
        groupUserRepository.save(changedGroupUser);

        this.notifyViaEmail(changedGroupUser, GroupMsg.CHANGED_GROUP_PERMISSION);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void kickUser(Long id, String token) {
        var userGroup = this.updateGroupUserStatus(id, token, false);
        this.notifyViaEmail(userGroup, GroupMsg.KICKED_USER_GROUP);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void reAddUser(Long id, String token) {
        var userGroup = this.updateGroupUserStatus(id, token, true);
        this.notifyViaEmail(userGroup, GroupMsg.RE_ADDED_USER_GROUP);
    }

    public Page<Group> findAllRelatedGroups(String email, String query, Pageable pageable) {
        return groupUserRepository.findAllRelatedGroups(email, query, pageable);
    }

    public List<GroupHasUsers> saveAll(List<GroupHasUsers> groupHasUsers) {
        return groupUserRepository.saveAll(groupHasUsers);
    }

    public boolean isNotAdminOnGroup(Long groupId, String userEmailOnGroup) {
        var currentUserInGroup = groupUserRepository
            .findByGroupIdAndJoinedUserInfoEmail(groupId, userEmailOnGroup)
            .orElseThrow(() -> new AppExc(ErrorCodes.FORBIDDEN_USER));
        return !currentUserInGroup.getRole().equals(GroupRole.ADMIN);
    }

    public List<Group> findAllRelatedToUser(String username) {
        return groupUserRepository.findAllRelatedToUser(username);
    }

    public List<UserInfo> getUsersGroupToAssign(Long id, String username) {
        return groupUserRepository.findAllUsersGroupToAssign(id, username);
    }

    public GroupHasUsers updateGroupUserStatus(Long userGroupId, String token, boolean status) {
        var curUser = userInfoService.getUserInfo(token);
        var updatedGroupUser = groupUserRepository.findById(userGroupId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (this.isNotAdminOnGroup(updatedGroupUser.getGroup().getId(), curUser.getEmail()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        if (updatedGroupUser.getJoinedUserInfo().getEmail().equals(curUser.getEmail()))
            throw new AppExc(ErrorCodes.CANT_KICK_YOURSELF);

        updatedGroupUser.setActive(status);
        groupUserRepository.save(updatedGroupUser);

        return updatedGroupUser;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void notifyViaEmail(GroupHasUsers userGroup, GroupMsg msgEnum) {
        var group = userGroup.getGroup();
        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(userGroup.getJoinedUserInfo().getEmail())
            .subject(msgEnum.getSubject())
            .body(msgEnum.format(group.getName()))
            .build());
    }
}
