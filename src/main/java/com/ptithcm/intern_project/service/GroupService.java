package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.response.*;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.mapper.GroupHasUserMapper;
import com.ptithcm.intern_project.mapper.GroupMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.ChangeGroupStatusRequest;
import com.ptithcm.intern_project.dto.request.GroupRequest;
import com.ptithcm.intern_project.dto.request.PaginationRequest;
import com.ptithcm.intern_project.dto.request.UpdatedGroupRequest;
import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.repository.GroupRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.IGroupService;
import com.ptithcm.intern_project.service.supports.PaginationService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class GroupService implements IGroupService {
    GroupRepository groupRepository;
    GroupHasUsersService groupUsersService;
    UserInfoService userInfoService;
    GroupMapper groupMapper;
    GroupHasUserMapper groupHasUserMapper;
    JwtService jwtService;
    GroupHasUsersService groupHasUsersService;
    UserInfoMapper userInfoMapper;

    @Override
    public PaginationResponse<GroupResponse> getPaginatedGroups(PaginationRequest request, String token) {
        var curUser = userInfoService.getUserInfo(token);
        var pageable = PageRequest.of(request.getPage() - 1, PaginationService.PAGE_SIZE);
        var groupsPage = groupUsersService.findAllRelatedGroups(curUser.getEmail(), request.getSearchVal(), pageable);
        var groupsList = groupsPage.stream().map(groupMapper::toResponse).toList();

        return PaginationResponse.<GroupResponse>builder()
            .totalPages(groupsPage.getTotalPages())
            .dataList(groupsList)
            .build();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public IdResponse create(GroupRequest request, String token) {
        var curUser = userInfoService.getUserInfo(token);

        var joinedUserList = userInfoService.findAllByEmailIn(request.getAssignedEmails());
        if (joinedUserList.size() != request.getAssignedEmails().size())
            throw new AppExc(ErrorCodes.INVALID_IDS);

        var savedGroup = groupRepository.save(groupMapper.newModel(request.getName(), curUser));

        var groupUserRelationships = new ArrayList<>(joinedUserList.stream()
            .map(user -> groupHasUserMapper.newMemberModel(savedGroup, user))
            .toList());

        groupUserRelationships.add(groupHasUserMapper.newAdminModel(savedGroup, curUser));
        groupUsersService.saveAll(groupUserRelationships);

        return IdResponse.builder().id(savedGroup.getId()).build();
    }

    @Override
    public DetailGroupResponse get(Long id, String token) {
        var curUser = userInfoService.getUserInfo(token);
        var group = groupRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!this.isRelatedToGroup(curUser.getEmail(), group))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var groupHasUsers = group.getGroupUsers().stream()
            .map(groupHasUserMapper::toResponse)
            .toList();

        return DetailGroupResponse.builder()
            .baseInfo(groupMapper.toResponse(group))
            .groupHasUsers(groupHasUsers)
            .build();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void update(Long id, UpdatedGroupRequest request, String token) {
        var curUser = userInfoService.getUserInfo(token);
        var changedGroup = groupRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (groupUsersService.isNotAdminOnGroup(id, curUser.getEmail()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var addedUsers = userInfoService.findAllByEmailIn(request.getAddedEmails());
        if (addedUsers.size() != request.getAddedEmails().size())
            throw new AppExc(ErrorCodes.INVALID_IDS);

        var newGroupUsers = addedUsers.stream()
            .map(user -> groupHasUserMapper.newMemberModel(changedGroup, user))
            .toList();
        changedGroup.getGroupUsers().addAll(newGroupUsers); //--Update Hibernate OneToMany cache
        changedGroup.setUpdatedTime(LocalDateTime.now());
        groupUsersService.saveAll(newGroupUsers);
    }

    @Override
    public void changeStatus(Long id, ChangeGroupStatusRequest request, String token) {
        var curUser = userInfoService.getUserInfo(token);
        var changedGroup = groupRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (groupUsersService.isNotAdminOnGroup(id, curUser.getEmail()))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        changedGroup.setActive(request.getStatus());
        changedGroup.setUpdatedTime(LocalDateTime.now());
        groupRepository.save(changedGroup);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortGroupResponse> getRelatedGroups(String token) {
        String username = jwtService.readPayload(token).get("sub");
        return groupHasUsersService.findAllRelatedToUser(username).stream()
            .map(group -> {
                var userGroup = group.getGroupUsers().stream()
                    .filter(groupHasUsers -> groupHasUsers.getJoinedUserInfo()
                        .getAccount()
                        .getUsername().equals(username))
                    .findFirst()
                    .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
                return groupMapper.shortenGroup(group, userGroup);
            })
            .toList();
    }

    @Override
    public List<ShortUserInfoDTO> getUsersGroupToAssign(Long id, String token) {
        String username = jwtService.readPayload(token).get("sub");
        return groupUsersService.getUsersGroupToAssign(id, username)
            .stream().map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    private boolean isRelatedToGroup(String email, Group group) {
        var userCreatedGroup = group.getUserInfoCreated().getEmail().equals(email);
        var userRelatedToGroup = group.getGroupUsers().stream().anyMatch(groupUser ->
            groupUser.getJoinedUserInfo().getEmail().equals(email)
        );
        return userCreatedGroup || userRelatedToGroup;
    }
}
