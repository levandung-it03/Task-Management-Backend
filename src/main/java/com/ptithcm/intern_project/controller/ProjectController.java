package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.*;
import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.service.ProjectService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProjectController {
    ProjectService projectService;

    @Operation(description = "Create Project by PM")
    @PostMapping(ROLE_PM + "/v1/project")
    public ResponseEntity<RestApiResponse<IdResponse>> create(
        @Valid @RequestBody ProjectRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, projectService.create(request, token));
    }

    @Operation(description = "Add a list of LEAD that joining Project")
    @PutMapping(ROLE_PM + "/v1/project/{id}/add-leaders")
    public ResponseEntity<RestApiResponse<Void>> addLeaders(
        @PathVariable("id") Long projectId,
        @Valid @RequestBody AddedLeaderRequest request,
        @RequestHeader("Authorization") String token) {
        projectService.addLeaders(projectId, request, token);
        return RestApiResponse.fromScs(SuccessCodes.CREATED);
    }

    @Operation(description = "Update basic information of Project")
    @PutMapping(ROLE_PM + "/v1/project/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable Long id,
        @Valid @RequestBody ProjectRequest request,
        @RequestHeader("Authorization") String token) {
        projectService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Kick a LEAD out of Project")
    @PostMapping(ROLE_PM + "/v1/project/{id}/kick-leader")
    public ResponseEntity<RestApiResponse<Void>> kickLeader(
        @PathVariable("id") Long id,
        @Valid @RequestBody KickedLeaderRequest request,
        @RequestHeader("Authorization") String token) {
        projectService.kickLeader(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.CREATED);
    }

    @Operation(description = "Delete the specified Project by PM")
    @DeleteMapping(ROLE_PM + "/v1/project/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        projectService.delete(id, token);
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
    }

    @Operation(description = "Get related Projects to see")
    @GetMapping({
        ROLE_EMP + "/v1/project/get-related-projects",
        ROLE_LEAD + "/v1/project/get-related-projects",
        ROLE_PM + "/v1/project/get-related-projects"})
    public ResponseEntity<RestApiResponse<List<Project>>> getRelatedProjects(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, projectService.getRelatedProjects(token));
    }

    @Operation(description = "Get all joined LEAD of Project by PM")
    @GetMapping(ROLE_PM + "/v1/project/{id}/get-leaders")
    public ResponseEntity<RestApiResponse<List<ProjectRoleResponse>>> getLeaders(
        @PathVariable Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, projectService.getLeaders(token, id));
    }

    @Operation(description = "Mark the Project the has been completed")
    @PutMapping(ROLE_PM + "/v1/project/{id}/complete")
    public ResponseEntity<RestApiResponse<Void>> complete(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        projectService.complete(token, id);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Create a Phase of specified Project")
    @PostMapping(ROLE_PM + "/v1/project/{id}/phase")
    public ResponseEntity<RestApiResponse<IdResponse>> createPhase(
        @PathVariable("id") Long projectId,
        @Valid @RequestBody PhaseRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, projectService.createPhase(projectId, request, token));
    }

    @Operation(description = "Get all Phases of specified Project")
    @GetMapping({
        ROLE_PM + "/v1/project/{id}/phases",
        ROLE_LEAD + "/v1/project/{id}/phases",
        ROLE_EMP + "/v1/project/{id}/phases",
    })
    public ResponseEntity<RestApiResponse<List<PhaseResponse>>> getAllRelatedPhases(
        @PathVariable("id") Long projectId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, projectService.getAllRelatedPhases(projectId, token));
    }

    @Operation(description = "Get statistic of all related Projects")
    @GetMapping({
        ROLE_PM + "/v1/project/short-projects",
        ROLE_LEAD + "/v1/project/short-projects",
        ROLE_EMP + "/v1/project/short-projects",
    })
    public ResponseEntity<RestApiResponse<ProjectStatisticResponse>> getProjectStatistic(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, projectService.getProjectStatistic(token));
    }

    @Operation(description = "Get new Leaders (by name or email) of specified Project to add")
    @GetMapping(ROLE_PM + "/v1/project/{projectId}/search-new-leaders/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> getLeadersToAddIntoProject(
        @PathVariable("projectId") Long projectId,
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL,
            projectService.getLeadersToAddIntoProject(projectId, query, token));
    }

    @Operation(description = "Get Project Overview")
    @GetMapping(ROLE_PM + "/v1/project/{projectId}/overview")
    public ResponseEntity<RestApiResponse<ProjectOverviewResponse>> getProjectOverview(
        @PathVariable("projectId") Long projectId) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL,
            projectService.getProjectOverview(projectId));
    }

    @Operation(description = "Get simple Phases to support statistic")
    @GetMapping(ROLE_PM + "/v1/project/{projectId}/simple-phases")
    public ResponseEntity<RestApiResponse<Map<Long, String>>> getSimplePhases(
        @PathVariable("projectId") Long projectId) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            projectService.getSimplePhases(projectId));
    }

    @Operation(description = "Get Project Overview")
    @GetMapping(ROLE_PM + "/v1/project/{projectId}/users-statistic")
    public ResponseEntity<RestApiResponse<List<UserStatisticDTO>>> getUsersStatistic(
        @PathVariable("projectId") Long projectId) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL,
            projectService.getUsersStatistic(projectId));
    }

    @Operation(description = "Get Project Detail (to support Phase Page)")
    @GetMapping({
        ROLE_PM + "/v1/project/{projectId}/detail",
        ROLE_LEAD + "/v1/project/{projectId}/detail",
        ROLE_EMP + "/v1/project/{projectId}/detail"})
    public ResponseEntity<RestApiResponse<ProjectDetailResponse>> getProjectDetail(
        @PathVariable("projectId") Long projectId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL,
            projectService.getProjectDetail(projectId, token));
    }

    @Operation(description = "Switch Project Status to In-progress and save startDate")
    @PutMapping(ROLE_PM + "/v1/project/{projectId}/start-project")
    public ResponseEntity<RestApiResponse<Void>> startProject(
        @PathVariable("projectId") Long projectId,
        @RequestHeader("Authorization") String token) {
        projectService.startProject(projectId, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Switch Project Status between Pause/In-progress")
    @PutMapping(ROLE_PM + "/v1/project/{projectId}/switch-pause-in-progress")
    public ResponseEntity<RestApiResponse<Void>> switchPauseAndInProgressProject(
        @PathVariable("projectId") Long projectId,
        @RequestHeader("Authorization") String token) {
        projectService.switchPauseAndInProgressProject(projectId, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }


    @Operation(description = "Switch Project Status to In-progress and save startDate")
    @PutMapping(ROLE_PM + "/v1/project/{projectId}/close-project")
    public ResponseEntity<RestApiResponse<Void>> closeProject(
        @PathVariable("projectId") Long projectId,
        @RequestHeader("Authorization") String token) {
        projectService.closeProject(projectId, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }
}