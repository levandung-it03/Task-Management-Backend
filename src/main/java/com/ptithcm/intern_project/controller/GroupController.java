package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.ChangeGroupStatusRequest;
import com.ptithcm.intern_project.dto.request.GroupRequest;
import com.ptithcm.intern_project.dto.request.PaginationRequest;
import com.ptithcm.intern_project.dto.request.UpdatedGroupRequest;
import com.ptithcm.intern_project.dto.response.*;
import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.service.GroupService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
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
public class GroupController {
    GroupService groupService;

    @Operation(description = "Search Groups by name")
    @PostMapping({ROLE_PM + "/group/search", ROLE_LEAD + "/group/search", ROLE_EMP + "/group/search"})
    public ResponseEntity<RestApiResponse<PaginationResponse<GroupResponse>>> getPaginatedGroups(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody PaginationRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, groupService.getPaginatedGroups(request, token));
    }

    @Operation(description = "Create a Group")
    @PostMapping({ROLE_PM + "/group", ROLE_LEAD + "/group"})
    public ResponseEntity<RestApiResponse<IdResponse>> create(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody GroupRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, groupService.create(request, token));
    }

    @Operation(description = "Get specified Group by id")
    @GetMapping({ROLE_PM + "/group/{id}", ROLE_LEAD + "/group/{id}", ROLE_EMP + "/group/{id}"})
    public ResponseEntity<RestApiResponse<DetailGroupResponse>> get(
        @RequestHeader("Authorization") String token,
        @PathVariable("id") Long id) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, groupService.get(id, token));
    }

    @Operation(description = "Update Group base info")
    @PutMapping({ROLE_PM + "/group/{id}", ROLE_LEAD + "/group/{id}"})
    public ResponseEntity<RestApiResponse<Void>> update(
        @RequestHeader("Authorization") String token,
        @PathVariable("id") Long id,
        @Valid @RequestBody UpdatedGroupRequest request) {
        groupService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Update Group status")
    @PutMapping({ROLE_PM + "/group/{id}/change-status", ROLE_LEAD + "/group/{id}/change-status"})
    public ResponseEntity<RestApiResponse<Void>> changeStatus(
        @RequestHeader("Authorization") String token,
        @PathVariable("id") Long id,
        @Valid @RequestBody ChangeGroupStatusRequest request) {
        groupService.changeStatus(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Get all related `Active` Groups by both Owner, or joined Users")
    @PutMapping({
        ROLE_PM + "/group/get-related-groups",
        ROLE_LEAD + "/group/get-related-groups",
        ROLE_EMP + "/group/get-related-groups",
    })
    public ResponseEntity<RestApiResponse<List<Group>>> getRelatedGroups(@RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, groupService.getRelatedGroups(token));
    }

    @Operation(description = "Get all joined Users by active Group-Id")
    @PutMapping({
        ROLE_PM + "/group/{id}/get-users-to-assign",
        ROLE_LEAD + "/group/{id}/get-users-to-assign",
        ROLE_EMP + "/group/{id}/get-users-to-assign",
    })
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> getUsersGroupToAssign(
        @PathVariable("id") String id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, groupService.getUsersGroupToAssign(id, token));
    }
}
