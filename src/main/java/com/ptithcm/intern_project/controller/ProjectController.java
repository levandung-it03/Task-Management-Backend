package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.request.AddedLeaderRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.ProjectRoleResponse;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.dto.request.KickedLeaderRequest;
import com.ptithcm.intern_project.service.ProjectService;
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

    @Operation(description = "Delete, or in-activate the specified Project by PM")
    @DeleteMapping(ROLE_LEAD + "/v1/project/{id}")
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
    @PostMapping(ROLE_PM + "/v1/project/{id}/create-phase")
    public ResponseEntity<RestApiResponse<IdResponse>> createPhase(
        @PathVariable("id") Long projectId,
        @Valid @RequestBody PhaseRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, projectService.createPhase(projectId, request, token));
    }

    @Operation(description = "Get all Phases of specified Project")
    @PostMapping({
        ROLE_PM + "/v1/project/{id}/get-all-related-phase",
        ROLE_LEAD + "/v1/project/{id}/get-all-related-phase",
        ROLE_EMP + "/v1/project/{id}/get-all-related-phase",
    })
    public ResponseEntity<RestApiResponse<List<Phase>>> getAllRelatedPhases(
        @PathVariable("id") Long projectId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, projectService.getAllRelatedPhases(projectId, token));
    }
}
