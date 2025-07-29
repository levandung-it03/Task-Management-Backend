package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.request.AddedLeaderRequest;
import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.ProjectRoleResponse;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.service.KickedLeaderRequest;
import com.ptithcm.intern_project.service.ProjectService;
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
public class ProjectController {
    ProjectService projectService;

    @PostMapping(ROLE_PM + "/project")
    public ResponseEntity<RestApiResponse<IdResponse>> create(
        @Valid @RequestBody ProjectRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, projectService.create(request, token));
    }

    @PutMapping(ROLE_PM + "/project/{id}")
    public ResponseEntity<RestApiResponse<Void>> addLeader(
        @PathVariable("id") Long projectId,
        @Valid @RequestBody AddedLeaderRequest request,
        @RequestHeader("Authorization") String token) {
        projectService.addLeader(projectId, request, token);
        return RestApiResponse.fromScs(SuccessCodes.CREATED);
    }

    @PutMapping(ROLE_PM + "/project/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable Long id,
        @Valid @RequestBody ProjectRequest request,
        @RequestHeader("Authorization") String token) {
        projectService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @PostMapping(ROLE_PM + "/project/{id}")
    public ResponseEntity<RestApiResponse<Void>> kickLeader(
        @PathVariable("id") Long id,
        @Valid @RequestBody KickedLeaderRequest request,
        @RequestHeader("Authorization") String token) {
        projectService.kickLeader(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.CREATED);
    }

    @DeleteMapping(ROLE_LEAD + "/project/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        projectService.delete(id, token);
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
    }

    @GetMapping({
        ROLE_EMP + "/project/get-related-projects",
        ROLE_LEAD + "/project/get-related-projects",
        ROLE_PM + "/project/get-related-projects"})
    public ResponseEntity<RestApiResponse<List<Project>>> getRelatedProjects(
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, projectService.getRelatedProjects(token));
    }

    @GetMapping(ROLE_PM + "/project/{id}/get-leaders")
    public ResponseEntity<RestApiResponse<List<ProjectRoleResponse>>> getLeaders(
        @PathVariable String id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, projectService.getLeaders(token, id));
    }
}
