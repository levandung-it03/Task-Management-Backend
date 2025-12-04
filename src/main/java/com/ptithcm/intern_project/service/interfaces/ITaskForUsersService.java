package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.dto.request.ReportRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.dto.response.ReportCommentsResponse;
import com.ptithcm.intern_project.model.enums.Domain;
import jakarta.validation.constraints.NotNull;

import java.util.List;
import java.util.Map;

public interface ITaskForUsersService {

    List<ShortUserInfoDTO> searchUsersOfRootToCreateSubTask(Long taskId, String query, String token);

    void kickUser(Long taskUserId, String token);

    void reAddUser(Long taskUserId, String token);

    IdResponse createReport(Long taskUserId, ReportRequest request, String token);

    List<ReportCommentsResponse> getReportsAndComments(Long taskUserId, String token);

    Map<String, Boolean> checkIsAssignedUserTask(Long taskUserId, String token);

    List<Long> getBusyUserIdsOnTaskType(Domain taskType);
}
