package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.request.KickedLeaderRequest;
import com.ptithcm.intern_project.dto.response.PhaseResponse;
import com.ptithcm.intern_project.dto.response.ProjectStatisticResponse;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.mapper.PhaseMapper;
import com.ptithcm.intern_project.mapper.ProjectMapper;
import com.ptithcm.intern_project.mapper.ProjectRoleMapper;
import com.ptithcm.intern_project.dto.request.AddedLeaderRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.ProjectRoleResponse;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.model.ProjectRole;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.enums.RoleOnEntity;
import com.ptithcm.intern_project.jpa.repository.ProjectRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.IProjectService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProjectService implements IProjectService {
    ProjectRepository projectRepository;
    ProjectMapper projectMapper;
    ProjectRoleService projectRoleService;
    UserInfoService userInfoService;
    JwtService jwtService;
    ProjectRoleMapper projectRoleMapper;
    PhaseService phaseService;
    PhaseMapper phaseMapper;

    @Override
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

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void addLeaders(Long id, AddedLeaderRequest request, String token) {
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

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long id, ProjectRequest request, String token) {
        var project = this.getUpdatableProject(id, token);

        projectMapper.updateModel(project, request);
        projectRepository.save(project);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Project getUpdatableProject(Long id, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var project = projectRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        var isProjectOwner = project.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isProjectOwner)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isEndedProject = project.getEndDate() != null;
        if (isEndedProject)     throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return project;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void kickLeader(Long id, KickedLeaderRequest request, String token) {
        var project = this.getUpdatableProject(id, token);
        var kickedLeader = projectRoleService.findByUserInfoEmail(request.getKickedEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        project.getProjectUsers().remove(kickedLeader);
        projectRoleService.delete(kickedLeader);
    }

    /**
     * <b>WARNING</b>: This method requires to be called within an active
     * {@code @Transactional} context.
     * <p>
     * Otherwise may throw {@code LazyInitializationException}
     */
    public static boolean isKickedLeader(Task task, String username) {
        return task
            .getCollection()
            .getPhase()
            .getProject()
            .getProjectUsers()
            .stream().filter(projectRole ->
                projectRole.getUserInfo().getAccount().getUsername().equals(username)
            ).findFirst().orElse(null) == null;
    }

    @Override
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

    @Override
    public List<Project> getRelatedProjects(String token) {
        HashMap<Long, Project> projects;
        String username = jwtService.readPayload(token).get("sub");
        //--PM, LEAD can see Projects as ProjectRole.MEMBER/ADMIN
        var relatedProjectsWithHighRole = projectRepository.findAllByUsernameHighRole(username);
        projects = new HashMap<>(relatedProjectsWithHighRole.stream().collect(
            Collectors.toMap(Project::getId, proj -> proj)
        ));
        //--LEAD, EMP can see Projects as an assigned User on Tasks
        var relatedProjectsWithLowRole = projectRepository.findAllByUsernameLowRole(username);
        projects.putAll(relatedProjectsWithLowRole.stream().collect(
            Collectors.toMap(Project::getId, proj -> proj)
        ));
        return new ArrayList<>(projects.values())
            .stream()
            .sorted((prev, next) -> {
                int prevValue = prev.getEndDate() == null ? -1 : 1;
                int nextValue = next.getEndDate() == null ? -1 : 1;
                return prevValue - nextValue;
            })
            .sorted(Comparator.comparing(Project::getStartDate))
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ProjectRoleResponse> getLeaders(String token, Long id) {
        String username = jwtService.readPayload(token).get("sub");
        var project = projectRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectOwner = project.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isProjectOwner)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return project.getProjectUsers().stream()
            .map(projectRoleMapper::toResponse)
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void complete(String token, Long id) {
        var updatedProject = this.getUpdatableProject(id, token);

        updatedProject.setEndDate(LocalDate.now());
        projectRepository.save(updatedProject);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public IdResponse createPhase(Long projectId, PhaseRequest request, String token) {
        var project = this.getUpdatableProject(projectId, token);
        return phaseService.create(project, request, token);
    }

    @Override
    public List<PhaseResponse> getAllRelatedPhases(Long projectId, String token) {
        var project = projectRepository.findById(projectId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        return phaseService.getAllRelatedPhases(project, token)
            .stream()
            .map(phaseMapper::toResponse)
            .sorted((prev, next) -> {
                int prevValue = prev.getEndDate() == null ? -1 : 1;
                int nextValue = next.getEndDate() == null ? -1 : 1;
                return prevValue - nextValue;
            })
            .sorted(Comparator.comparing(PhaseResponse::getStartDate))
            .toList();
    }

    @Override
    public ProjectStatisticResponse getProjectStatistic(String token) {
        List<Project> relatedProjects = this.getRelatedProjects(token);

        var response = new ProjectStatisticResponse();
        for (Project project : relatedProjects) {
            var isEndedProject = project.getEndDate() != null;
            if (isEndedProject) {
                response.setEndedProjects(response.getEndedProjects() + 1);
                continue;
            }
            var isStartedProject = !LocalDate.now().isBefore(project.getStartDate());
            if (isStartedProject) {
                response.setRunningProjects(response.getRunningProjects() + 1);
                continue;
            }
            var isPendingProject = LocalDate.now().isBefore(project.getStartDate());
            if (isPendingProject)   response.setPendingProjects(response.getPendingProjects() + 1);
        }
        response.setTotalProjects(relatedProjects.size());
        return response;
    }
}
