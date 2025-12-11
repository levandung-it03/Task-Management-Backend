package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import com.ptithcm.intern_project.model.dto.request.RecUsersRequest;
import com.ptithcm.intern_project.model.dto.response.MaxUsersForModelResponse;
import com.ptithcm.intern_project.model.dto.response.RecUserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.RecommendingUsersResponse;
import com.ptithcm.intern_project.model.enums.Domain;
import com.ptithcm.intern_project.service.RecUsersForTaskService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ptithcm.intern_project.config.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class RecUsersForTaskController {
    RecUsersForTaskService recUsersSvc;

    @PostMapping({
        ROLE_PM + "/v1/task-user-rec/recommend-users",
        ROLE_LEAD + "/v1/task-user-rec/recommend-users",
    })
    public ResponseEntity<RestApiResponse<List<RecUserInfoResponse>>> recommendUsers(
        @RequestBody RecUsersRequest request) {
        var result = recUsersSvc.recommendUsers(request);
        if (result.isEmpty())
            return RestApiResponse.fromScs(SuccessCodes.EMPTY_USERS, result);
        else
            return RestApiResponse.fromScs(SuccessCodes.GET_LIST, result);
    }

    @GetMapping({
        ROLE_PM + "/v1/task-user-rec/get-max-users-qty",
        ROLE_LEAD + "/v1/task-user-rec/get-max-users-qty",
    })
    public ResponseEntity<RestApiResponse<MaxUsersForModelResponse>> getMaxUsersQty(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, recUsersSvc.getMaxUsersQty(token));
    }


}
