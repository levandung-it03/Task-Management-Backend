package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.general.StatusDTO;
import com.ptithcm.intern_project.dto.response.UserTaskResponse;
import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.request.UpdatedContentRequest;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.service.TaskService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskController {
    TaskService taskService;

    @Operation(description = "Create Sub-Task of a Root-Task")
    @PostMapping({
        ROLE_PM + "/v1/task/{id}/create-sub-task",
        ROLE_LEAD + "/v1/task/{id}/create-sub-task"})
    public ResponseEntity<RestApiResponse<IdResponse>> createSubTask(
        @PathVariable("id") Long id,
        @Valid @RequestBody TaskRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, taskService.createSubTask(id, request, token));
    }

    @Operation(description = "Get Task detail")
    @GetMapping({
        ROLE_PM + "/v1/task/{id}",
        ROLE_LEAD + "/v1/task/{id}",
        ROLE_EMP + "/v1/task/{id}"})
    public ResponseEntity<RestApiResponse<TaskResponse>> get(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, taskService.get(id, token));
    }

    @Operation(description = "Update Task Description")
    @PutMapping({
        ROLE_PM + "/v1/task/{id}/update-description",
        ROLE_LEAD + "/v1/task/{id}/update-description"})
    public ResponseEntity<RestApiResponse<Void>> updateDescription(
        @PathVariable("id") Long id,
        @Valid @RequestBody UpdatedContentRequest request,
        @RequestHeader("Authorization") String token) {
        taskService.updateDescription(id, request.getContent(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Update Task Report Format")
    @PutMapping({
        ROLE_PM + "/v1/task/{id}/update-report-format",
        ROLE_LEAD + "/v1/task/{id}/update-report-format"})
    public ResponseEntity<RestApiResponse<Void>> updateReportFormat(
        @PathVariable("id") Long id,
        @Valid @RequestBody UpdatedContentRequest request,
        @RequestHeader("Authorization") String token) {
        taskService.updateReportFormat(id, request.getContent(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Update Task base information")
    @PutMapping({
        ROLE_PM + "/v1/task/{id}",
        ROLE_LEAD + "/v1/task/{id}"})
    public ResponseEntity<RestApiResponse<Void>> updateTask(
        @PathVariable("id") Long id,
        @Valid @RequestBody UpdatedTaskRequest request,
        @RequestHeader("Authorization") String token) {
        taskService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Get all Users by Task-Id to render on Task-Detail")
    @GetMapping({
        ROLE_PM + "/v1/task/{id}/get-assigned-users",
        ROLE_LEAD + "/v1/task/{id}/get-assigned-users"})
    public ResponseEntity<RestApiResponse<List<UserTaskResponse>>> getUsersOfTask(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, taskService.getUsersOfTask(id, token));
    }

    @Operation(description = "Update specified Task that it's done")
    @PutMapping({
        ROLE_PM + "/v1/task/{id}/done",
        ROLE_LEAD + "/v1/task/{id}/done"})
    public ResponseEntity<RestApiResponse<Void>> updateDoneTask(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        taskService.updateDoneTask(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Lock/Unlock the specified Task")
    @PutMapping({
        ROLE_PM + "/v1/task/{id}/update-locked-status",
        ROLE_LEAD + "/v1/task/{id}/update-locked-status"})
    public ResponseEntity<RestApiResponse<Void>> updateLockedStatusTask(
        @PathVariable("id") Long id,
        @Valid @RequestBody StatusDTO request,
        @RequestHeader("Authorization") String token) {
        taskService.updateLockedStatusTask(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Get all Sub-Tasks of specified Root-Task")
    @GetMapping({
        ROLE_PM + "/v1/task/{id}/sub-tasks",
        ROLE_LEAD + "/v1/task/{id}/sub-tasks",
        ROLE_EMP + "/v1/task/{id}/sub-tasks"})
    public ResponseEntity<RestApiResponse<List<ShortTaskResponse>>> getSubTasksOfRootTask(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, taskService.getSubTasksOfRootTask(id, token));
    }

    @Operation(description = "Search Users by `query` to add into an existing Task (only Owner can use this)")
    @GetMapping({
        ROLE_PM + "/v1/task/{id}/search-new-users/{query}",
        ROLE_LEAD + "/v1/task/{id}/search-new-users/{query}"})
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> searchNewAddedUsersForRootTask(
        @PathVariable("id") Long id,
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            taskService.searchNewAddedUsersForRootTask(id, query, token));
    }

    @Operation(description = "Search Users by `query` of a root Task to created Sub-Task (only Owner can use this)")
    @GetMapping({
        ROLE_PM + "/v1/task/{rootId}/search-users/{query}",
        ROLE_LEAD + "/v1/task/{rootId}/search-users/{query}"})
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> searchRootTaskUsers(
        @PathVariable("rootId") Long rootId,
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            taskService.searchRootTaskUsers(rootId, query, token));
    }

    @Operation(description = "Get all related and undone Tasks")
    @GetMapping({
        ROLE_EMP + "/v1/task/get-all-undone",
        ROLE_PM + "/v1/task/get-all-undone",
        ROLE_LEAD + "/v1/task/get-all-undone"})
    public ResponseEntity<RestApiResponse<List<ShortTaskResponse>>> searchRootTaskUsers(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            taskService.getAllRelatedUndoneTasks(token));
    }
}
