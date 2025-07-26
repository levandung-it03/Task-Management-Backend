package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.service.TaskForUsersService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/v1/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskForUsersController {
    TaskForUsersService taskForUsersService;

    @Operation(description = "Searching User-Info that is assigned to Root-Task, for creating Sub-Task")
    @GetMapping({
        ROLE_PM + "/task-user/search/{query}",
        ROLE_LEAD + "/task-user/search/{query}"})
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> searchUsersOfRootToCreateSubTask(
        @PathVariable("query") String query,
        @RequestParam("taskId") Long taskId,
        @RequestHeader("Authorization") String token
    ) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            taskForUsersService.searchUsersOfRootToCreateSubTask(taskId, query, token));
    }

    @Operation(description = "Kick User out of specified Task")
    @GetMapping({
        ROLE_PM + "/task-user/{taskUserId}/kick-user",
        ROLE_LEAD + "/task-user/{taskUserId}/kick-user"})
    public ResponseEntity<RestApiResponse<Void>> kickUser(
        @PathVariable("taskUserId") Long taskUserId,
        @RequestHeader("Authorization") String token) {
        taskForUsersService.kickUser(taskUserId, token);
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST);
    }

    @Operation(description = "Re-add User of specified Task")
    @GetMapping({
        ROLE_PM + "/task-user/{taskUserId}/re-add-user",
        ROLE_LEAD + "/task-user/{taskUserId}/re-add-user"})
    public ResponseEntity<RestApiResponse<Void>> reAddUser(
        @PathVariable("taskUserId") Long taskUserId,
        @RequestHeader("Authorization") String token) {
        taskForUsersService.reAddUser(taskUserId, token);
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST);
    }
}
