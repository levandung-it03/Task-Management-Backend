package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.dto.request.ChangeGroupStatusRequest;
import com.ptithcm.intern_project.model.dto.request.GroupRequest;
import com.ptithcm.intern_project.model.dto.request.PaginationRequest;
import com.ptithcm.intern_project.model.dto.request.UpdatedGroupRequest;
import com.ptithcm.intern_project.model.dto.response.*;
import com.ptithcm.intern_project.service.GroupService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
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
public class GroupController {
    GroupService groupService;

    @Operation(description = "Search Groups by name")
    @PostMapping({ROLE_PM + "/v1/group/search", ROLE_LEAD + "/v1/group/search", ROLE_EMP + "/v1/group/search"})
    public ResponseEntity<RestApiResponse<PaginationResponse<GroupResponse>>> getPaginatedGroups(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody PaginationRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, groupService.getPaginatedGroups(request, token));
    }

    @Operation(description = "Create a Group")
    @PostMapping({ROLE_PM + "/v1/group", ROLE_LEAD + "/v1/group"})
    public ResponseEntity<RestApiResponse<IdResponse>> create(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody GroupRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, groupService.create(request, token));
    }

    @Operation(description = "Get specified Group by id")
    @GetMapping({ROLE_PM + "/v1/group/{id}", ROLE_LEAD + "/v1/group/{id}", ROLE_EMP + "/v1/group/{id}"})
    public ResponseEntity<RestApiResponse<DetailGroupResponse>> get(
        @RequestHeader("Authorization") String token,
        @PathVariable("id") Long id) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, groupService.get(id, token));
    }

    @Operation(description = "Update Group base info")
    @PutMapping({ROLE_PM + "/v1/group/{id}", ROLE_LEAD + "/v1/group/{id}"})
    public ResponseEntity<RestApiResponse<Void>> update(
        @RequestHeader("Authorization") String token,
        @PathVariable("id") Long id,
        @Valid @RequestBody UpdatedGroupRequest request) {
        groupService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Update Group status")
    @PutMapping({ROLE_PM + "/v1/group/{id}/change-status", ROLE_LEAD + "/v1/group/{id}/change-status"})
    public ResponseEntity<RestApiResponse<Void>> changeStatus(
        @RequestHeader("Authorization") String token,
        @PathVariable("id") Long id,
        @Valid @RequestBody ChangeGroupStatusRequest request) {
        groupService.changeStatus(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Get all related `Active` Groups by both Owner, or joined Users")
    @GetMapping({
        ROLE_PM + "/v1/group/get-related-groups",
        ROLE_LEAD + "/v1/group/get-related-groups",
        ROLE_EMP + "/v1/group/get-related-groups"})
    public ResponseEntity<RestApiResponse<List<ShortGroupResponse>>> getRelatedGroups(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, groupService.getRelatedGroups(token));
    }

    @Operation(description = "Get all joined Users by active Group-Id")
    @GetMapping({
        ROLE_PM + "/v1/group/{id}/get-users-to-assign",
        ROLE_LEAD + "/v1/group/{id}/get-users-to-assign",
        ROLE_EMP + "/v1/group/{id}/get-users-to-assign"})
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> getUsersGroupToAssign(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, groupService.getUsersGroupToAssign(id, token));
    }

    @Operation(description = "Check if this user-group of cur-user in this group relationship is ADMIN or not")
    @GetMapping({ROLE_PM + "/v1/group/{id}/is-admin", ROLE_LEAD + "/v1/group/{id}/is-admin"})
    public ResponseEntity<RestApiResponse<StatsResponse>> checkIfIsAdmin(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.UPDATED, groupService.checkIfIsAdmin(id, token));
    }
}
