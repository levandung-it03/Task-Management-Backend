package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.request.RecUsersRequest;
import com.ptithcm.intern_project.model.dto.response.MaxUsersForModelResponse;
import com.ptithcm.intern_project.model.dto.response.RecUserInfoResponse;

import java.util.List;

public interface IRecUsersForTaskService {
    List<RecUserInfoResponse> recommendUsers(RecUsersRequest request);

    MaxUsersForModelResponse getMaxUsersQty(String token);
}
