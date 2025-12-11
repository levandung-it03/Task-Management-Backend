package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.dto.request.RecUsersByModelRequest;
import com.ptithcm.intern_project.model.dto.request.RecUsersRequest;
import com.ptithcm.intern_project.model.dto.response.RecUserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.UserPredScoreResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecUsersForTaskMapper {

    public RecUsersByModelRequest toClientRequest(RecUsersRequest request) {
        var result = new RecUsersByModelRequest();
        result.setNumOfEmp(request.getNumOfEmp());
        result.setPriority(request.getPriority());
        result.setLevel(request.getLevel());
        result.setDomain(request.getDomain());
        return result;
    }

    public RecUserInfoResponse toResponse(UserInfo userInfo, UserPredScoreResponse userScore) {
        return RecUserInfoResponse.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .department(userInfo.getDepartment().getName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .score(userScore.getScore())
            .build();
    }
}
