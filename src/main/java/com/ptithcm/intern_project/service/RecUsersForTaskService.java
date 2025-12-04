package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.config.enums.TokenClaimNames;
import com.ptithcm.intern_project.mapper.RecUsersForTaskMapper;
import com.ptithcm.intern_project.model.dto.request.RecUsersByModelRequest;
import com.ptithcm.intern_project.model.dto.request.RecUsersRequest;
import com.ptithcm.intern_project.model.dto.response.MaxUsersForModelResponse;
import com.ptithcm.intern_project.model.dto.response.RecUserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.UserPredScoreResponse;
import com.ptithcm.intern_project.model.enums.Domain;
import com.ptithcm.intern_project.service.auth.JwtService;
import com.ptithcm.intern_project.service.interf.TaskUserPredService;
import com.ptithcm.intern_project.service.interfaces.IRecUsersForTaskService;
import com.ptithcm.intern_project.service.trans.RecUsersForTaskTransService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RecUsersForTaskService implements IRecUsersForTaskService {
    TaskUserPredService taskUserPredSvc;
    TaskForUsersService taskForUsersSvc;
    UserInfoService userInfoService;
    RecUsersForTaskMapper recUsersForTaskMapper;
    JwtService jwtService;
    RecUsersForTaskTransService transSvc;

    @Override
    public List<RecUserInfoResponse> recommendUsers(RecUsersRequest request) {
        var ignoredUserIds = this.findAllIgnoredUserIds(request.getDomain());
        request.setIgnoredIds(ignoredUserIds);
        RecUsersByModelRequest clientRequest = recUsersForTaskMapper.toClientRequest(request);

        List<UserPredScoreResponse> rankedUserScores = taskUserPredSvc.recommendUserIds(clientRequest);
        return transSvc.preHandleUserScoresResponse(request, rankedUserScores);
    }

    private Collection<Long> findAllIgnoredUserIds(Domain domain) {
        var busyUserIds = taskForUsersSvc.getBusyUserIdsOnTaskType(domain);
        var inactiveIds = userInfoService.findAllInactiveUsersByAccount();

        Set<Long> ignoredIds = new LinkedHashSet<>(inactiveIds);
        ignoredIds.addAll(busyUserIds);

        return inactiveIds;
    }

    @Override
    public MaxUsersForModelResponse getMaxUsersQty(String token) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        var result = userInfoService.countAllForModel(claims.get(TokenClaimNames.SCOPES.getStr()));
        return MaxUsersForModelResponse.builder()
            .maxQuantity(result)
            .build();
    }
}
