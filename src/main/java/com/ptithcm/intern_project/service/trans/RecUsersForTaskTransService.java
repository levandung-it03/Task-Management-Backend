package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.mapper.RecUsersForTaskMapper;
import com.ptithcm.intern_project.model.GroupHasUsers;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.dto.request.RecUsersRequest;
import com.ptithcm.intern_project.model.dto.response.RecUserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.UserPredScoreResponse;
import com.ptithcm.intern_project.service.GroupHasUsersService;
import com.ptithcm.intern_project.service.UserInfoService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RecUsersForTaskTransService {
    UserInfoService userInfoService;
    GroupHasUsersService groupHasUsersService;
    RecUsersForTaskMapper recUsersForTaskMapper;

    @Transactional(readOnly = true, propagation = Propagation.NESTED)
    public List<RecUserInfoResponse> preHandleUserScoresResponse(
        RecUsersRequest request,
        List<UserPredScoreResponse> rankedUserScores
    ) {
        var userScoresMap = rankedUserScores.stream().collect(Collectors.toMap(
            UserPredScoreResponse::getUserId,
            response -> response));
        var rankedUserIds = rankedUserScores.stream().map(UserPredScoreResponse::getUserId).toList();
        var usersResult = userInfoService.findAllByIdsAndAuthority(rankedUserIds, request.getAuthority());
        var usersResultMap = usersResult.stream().collect(Collectors.toMap(UserInfo::getId, user -> user));

        if (request.getNumOfEmp() > rankedUserIds.size())
            request.setNumOfEmp(rankedUserIds.size());
        var rankedUserIdsResult = rankedUserIds.stream()
            .filter(usersResultMap::containsKey)
            .limit(request.getNumOfEmp())
            .collect(Collectors.toList());

        List<GroupHasUsers> relatedGroups = groupHasUsersService.findAllByUserInfoIds(rankedUserIdsResult);
        var userGroupsMap = new HashMap<Long, List<Long>>();
        for (GroupHasUsers groupUser : relatedGroups) {
            var group = groupUser.getGroup();   //--LAZY fetch here
            var userInfo = groupUser.getJoinedUserInfo();

            if (userGroupsMap.containsKey(userInfo.getId())) {
                userGroupsMap.get(userInfo.getId()).add(group.getId());
            } else {
                var groupIds = new ArrayList<>(List.of(group.getId()));
                userGroupsMap.put(userInfo.getId(), groupIds);
            }
        }
        return rankedUserIdsResult.stream()
            .map(userId -> recUsersForTaskMapper.toResponse(
                usersResultMap.get(userId),
                userScoresMap.get(userId),
                userGroupsMap.containsKey(userId) ? userGroupsMap.get(userId) : List.of()
            )).toList();
    }
}
