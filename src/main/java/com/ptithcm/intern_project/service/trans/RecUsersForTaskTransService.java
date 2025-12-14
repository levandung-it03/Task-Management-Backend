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
import java.util.Map;
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

        List<GroupHasUsers> relatedGroups = groupHasUsersService.findAllByGroupId(request.getGroupId());
        Map<Long, GroupHasUsers> relatedUsers = relatedGroups.stream()
            .collect(Collectors.toMap(ghu -> ghu.getJoinedUserInfo().getId(), ghu -> ghu));
        var rankedUserIdsResult = rankedUserIds.stream()
            .filter(userId ->
                usersResultMap.containsKey(userId)
                    && (relatedUsers.isEmpty()
                        || (relatedUsers.containsKey(userId) && relatedUsers.get(userId).isActive()))
            ).limit(request.getNumOfEmp())
            .toList();

        return rankedUserIdsResult.stream()
            .map(userId -> recUsersForTaskMapper.toResponse(
                usersResultMap.get(userId),
                userScoresMap.get(userId)
            )).toList();
    }
}
