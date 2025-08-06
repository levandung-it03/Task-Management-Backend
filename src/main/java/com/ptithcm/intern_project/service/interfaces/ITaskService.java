package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.general.StatusDTO;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.dto.response.UserTaskResponse;

import java.util.List;

public interface ITaskService {

    IdResponse createSubTask(Long id, TaskRequest request, String token);

    TaskResponse get(Long id, String token);

    void updateDescription(Long id, String content, String token);

    void updateReportFormat(Long id, String content, String token);

    void update(Long id, UpdatedTaskRequest request, String token);

    List<UserTaskResponse> getUsersOfTask(Long id, String token);

    List<ShortTaskResponse> getAllRelatedUndoneTasks(String token);

    void updateDoneTask(Long id, String token);

    void updateLockedStatusTask(Long id, StatusDTO request, String token);

    List<ShortTaskResponse> getSubTasksOfRootTask(Long id, String token);

    List<ShortUserInfoDTO> searchNewAddedUsersForRootTask(Long id, String query, String token);

    List<ShortUserInfoDTO> searchRootTaskUsers(Long rootId, String query, String token);

    void delete(Long id, String token);
}
