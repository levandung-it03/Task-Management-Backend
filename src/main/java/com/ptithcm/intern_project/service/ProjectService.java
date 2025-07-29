package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.mapper.ProjectMapper;
import com.ptithcm.intern_project.common.mapper.ProjectRoleMapper;
import com.ptithcm.intern_project.dto.request.AddedLeaderRequest;
import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.ProjectRoleResponse;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.model.ProjectRole;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.enums.RoleOnEntity;
import com.ptithcm.intern_project.jpa.repository.ProjectRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProjectService {
    ProjectRepository projectRepository;
    ProjectMapper projectMapper;
    ProjectRoleService projectRoleService;
    UserInfoService userInfoService;
    JwtService jwtService;
    ProjectRoleMapper projectRoleMapper;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public IdResponse create(ProjectRequest request, String token) {
        var userInfoCreated = userInfoService.getUserInfo(token);
        var project = projectMapper.newModel(request, userInfoCreated);

        var savedProject = projectRepository.save(project);
        var projectRoles = projectRoleService.saveAll(
            List.of(ProjectRole.builder()
                .project(savedProject)
                .userInfo(userInfoCreated)
                .role(RoleOnEntity.OWNER)
                .build())
        );

        savedProject.setProjectUsers(new ArrayList<>(projectRoles));
        return IdResponse.builder().id(savedProject.getId()).build();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void addLeader(Long id, AddedLeaderRequest request, String token) {
        var project = this.getUpdatableProject(id, token);

        var newLeadersInfo = userInfoService.findAllByEmailIn(request.getAssignedEmails());
        var newProjectRoles = newLeadersInfo.stream()
            .map(user -> ProjectRole.builder()
                .project(project)
                .role(RoleOnEntity.MEMBER)
                .userInfo(user)
                .build()
            ).toList();

        projectRoleService.saveAll(newProjectRoles);
        project.getProjectUsers().addAll(newProjectRoles);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long id, ProjectRequest request, String token) {
        var project = this.getUpdatableProject(id, token);

        projectMapper.updateModel(project, request);
        projectRepository.save(project);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Project getUpdatableProject(Long id, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var project = projectRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        var isProjectOwner = project.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isProjectOwner)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return project;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void kickLeader(Long id, KickedLeaderRequest request, String token) {
        var project = this.getUpdatableProject(id, token);
        var kickedLeader = projectRoleService.findByUserInfoEmail(request.getKickedEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        project.getProjectUsers().remove(kickedLeader);
        projectRoleService.delete(kickedLeader);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public boolean isKickedLeader(Task task, String username) {
        return task
            .getCollection()
            .getPhase()
            .getProject()
            .getProjectUsers()
            .stream().filter(projectRole ->
                projectRole.getUserInfo().getAccount().getUsername().equals(username)
            ).findFirst().orElse(null) == null;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void delete(Long id, String token) {
        var project = this.getUpdatableProject(id, token);
        if (project.getProjectUsers().isEmpty()) {
            projectRepository.delete(project);
            return;
        }
        project.setActive(false);
        projectRepository.save(project);
    }

    public List<Project> getRelatedProjects(String token) {
        var username = jwtService.readPayload(token).get("sub");
        var projectRoles = projectRoleService.findByUserInfoAccountUsername(username);
        return projectRoles.stream().map(ProjectRole::getProject).toList();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ProjectRoleResponse> getLeaders(String token, String id) {
        var username = jwtService.readPayload(token).get("sub");
        var project = projectRepository.findById(Long.parseLong(id))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectOwner = project.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isProjectOwner)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return project.getProjectUsers().stream()
            .map(projectRoleMapper::toResponse)
            .toList();
    }
}
