package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.*;
import com.ptithcm.intern_project.model.dto.request.AddedLeaderRequest;
import com.ptithcm.intern_project.model.dto.request.KickedLeaderRequest;
import com.ptithcm.intern_project.model.dto.request.PhaseRequest;
import com.ptithcm.intern_project.model.dto.request.ProjectRequest;
import com.ptithcm.intern_project.model.dto.response.*;
import com.ptithcm.intern_project.model.enums.ProjectStatus;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import com.ptithcm.intern_project.mapper.PhaseMapper;
import com.ptithcm.intern_project.mapper.ProjectMapper;
import com.ptithcm.intern_project.mapper.ProjectRoleMapper;
import com.ptithcm.intern_project.model.enums.RoleOnEntity;
import com.ptithcm.intern_project.repository.ProjectRepository;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.service.auth.JwtService;
//import com.ptithcm.intern_project.service.authzed.AuthProjectSvc;
import com.ptithcm.intern_project.service.interfaces.IProjectService;
import com.ptithcm.intern_project.service.email.messages.ProjectMsg;
import com.ptithcm.intern_project.service.email.EmailQueueService;
import com.ptithcm.intern_project.service.email.EmailService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;
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
    UserInfoMapper userInfoMapper;
    EmailQueueService emailQueueService;
    EmailService emailService;
    ReportService reportService;
    TaskService taskService;
    TaskForUsersService taskForUsersService;
//    AuthProjectSvc authProjectSvc;

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
        project.getProjectUsers().addAll(projectRoles);
        savedProject.getProjectUsers().addAll(new ArrayList<>(projectRoles));

//        authProjectSvc.addOwnerPermission(userInfoCreated.getId(), savedProject.getId());

        return IdResponse.builder().id(savedProject.getId()).build();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void addLeaders(Long id, AddedLeaderRequest request, String token) {
        var project = this.getUpdatableProject(id, token);
        var existsProjectRoleMap = project.getProjectUsers().stream()
            .collect(Collectors.toMap(
                projRole -> projRole.getUserInfo().getEmail(),
                projRole -> projRole));

        var newLeadersInfo = userInfoService.findAllByEmailIn(request.getAssignedEmails());
        var newProjectRoles = newLeadersInfo.stream()
            .filter(projectRole -> !existsProjectRoleMap.containsKey(projectRole.getEmail()))
            .map(user -> ProjectRole.builder()
                .project(project)
                .role(RoleOnEntity.MEMBER)
                .userInfo(user)
                .build()
            ).toList();

        project.getProjectUsers().addAll(newProjectRoles);
        projectRepository.save(project);

//        authProjectSvc.addMembersPermission(newProjectRoles, project.getId());

        this.notifyViaEmail(newProjectRoles, ProjectMsg.ADDED_INTO_PROJECT);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long id, ProjectRequest request, String token) {
        var project = this.getProjectByOwner(id, token);
        //--Checked in progress by "project"

        var phases = phaseService.findAllProjectId(project.getId());
        for (Phase phase : phases) {
            var isBefore = request.getExpectedStartDate().isAfter(phase.getStartDate());
            if (isBefore)
                throw new AppExc(ErrorCodes.START_BEFORE_PHASE);
            if (request.getDueDate().isBefore(phase.getDueDate()))
                throw new AppExc(ErrorCodes.END_BEFORE_PHASE);
        }
        projectMapper.updateModel(project, request);
        var updatedProject = projectRepository.save(project);

        this.notifyViaEmail(updatedProject.getProjectUsers(), ProjectMsg.UPDATED_PROJECT);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Project getUpdatableProject(Long id, String token) {
        var project = this.getProjectByOwner(id, token);

        var isProjectInProgress = project.getStatus().equals(ProjectStatus.IN_PROGRESS)
            || project.getStatus().equals(ProjectStatus.CREATED);
        if (!isProjectInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        return project;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void kickLeader(Long id, KickedLeaderRequest request, String token) {
        var project = this.getUpdatableProject(id, token);
        //--Checked in progress by "project"

        var kickedLeader = projectRoleService.findByUserInfoEmail(request.getKickedEmail())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        project.getProjectUsers().remove(kickedLeader);
        projectRepository.save(project);

        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(kickedLeader.getUserInfo().getEmail())
            .subject(ProjectMsg.KICKED_LEADER.getSubject())
            .body(ProjectMsg.KICKED_LEADER.format(project.getName()))
            .build());
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
        String username = jwtService.readPayload(token).get("sub");
        var project = this.getProjectByOwner(id, token);

        var removedOwner = project.getProjectUsers().stream()
            .filter(projectRole -> !projectRole.getUserInfo().getAccount().getUsername().equals(username))
            .toList();
        var canDeleteProject = removedOwner.isEmpty() && !phaseService.existsByProjectId(project.getId());
        if (!canDeleteProject)
            throw new AppExc(ErrorCodes.CANT_DELETE_PROJECT_WITH_PHASE);

        projectRepository.delete(project);
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
            .sorted(Comparator.comparing(Project::getStartDate, Comparator.nullsFirst(Comparator.naturalOrder())))
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ProjectRoleResponse> getLeaders(String token, Long id) {
        var project = this.getProjectByOwner(id, token);
        return project.getProjectUsers().stream()
            .map(projectRoleMapper::toResponse)
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void complete(String token, Long id) {
        var updatedProject = this.getProjectByOwner(id, token);

        var isProjectInProgress = updatedProject.getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var existNotCompletePhase = phaseService.existsNotCompleteByProjectId(updatedProject.getId());
        if (existNotCompletePhase)  throw new AppExc(ErrorCodes.CANT_COMPLETE_PROJECT);

        updatedProject.setEndDate(LocalDate.now());
        updatedProject.setStatus(ProjectStatus.COMPLETED);
        projectRepository.save(updatedProject);

        this.notifyViaEmail(updatedProject.getProjectUsers(), ProjectMsg.COMPLETED_PROJECT);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public IdResponse createPhase(Long projectId, PhaseRequest request, String token) {
        var project = this.getProjectByOwner(projectId, token);

        if (!project.getStatus().equals(ProjectStatus.CREATED)
            && !project.getStatus().equals(ProjectStatus.IN_PROGRESS))
            throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

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
            var isStartedProject = project.getStartDate() != null;
            if (isStartedProject) {
                response.setRunningProjects(response.getRunningProjects() + 1);
                continue;
            }
            var isPendingProject = project.getStatus().equals(ProjectStatus.CREATED);
            if (isPendingProject)   response.setPendingProjects(response.getPendingProjects() + 1);
        }
        response.setTotalProjects(relatedProjects.size());
        return response;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortUserInfoDTO> getLeadersToAddIntoProject(Long projectId, String query, String token) {
        var project = this.getProjectByOwner(projectId, token);
        var existsLeaderEmailList = project.getProjectUsers().stream()
            .map(projectRole -> projectRole.getUserInfo().getEmail())
            .toList();
        List<UserInfo> newLeaders = userInfoService.searchAllLeaderByNotEmailIn(existsLeaderEmailList, query);
        return newLeaders.stream()
            .map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    private Project getProjectByOwner(Long projectId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var project = projectRepository.findById(projectId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isOwner = project.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return project;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void notifyViaEmail(List<ProjectRole> projectRoles, ProjectMsg projectMsg) {
        var project = projectRoles.getFirst().getProject();
        for (var projectRole: projectRoles) {
            if (projectRole.getRole().equals(RoleOnEntity.OWNER))
                continue;
            emailQueueService.addToQueue(EmailTaskDTO.builder()
                .to(projectRole.getUserInfo().getEmail())
                .subject(projectMsg.getSubject())
                .body(projectMsg.format(project.getName()))
                .build());
        }
    }

    @Override
    public ProjectOverviewResponse getProjectOverview(Long projectId) {
        var project = projectRepository.findById(projectId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        var approvedReports = reportService.countAllInProjectByStatus(projectId, ReportStatus.APPROVED.toString());
        var rejectedReports = reportService.countAllInProjectByStatus(projectId, ReportStatus.REJECTED.toString());
        var doneTaskOnTime = taskService.countAllInProjectDoneOnTime(projectId);
        var doneTaskLate = taskService.countAllInProjectLate(projectId);

        var response = projectMapper.toResponse(project);
        response.setTotalApproved(approvedReports);
        response.setTotalRejected(rejectedReports);
        response.setTotalDoneTaskOnTime(doneTaskOnTime);
        response.setTotalDoneTaskLate(doneTaskLate);
        return response;
    }

    @Override
    public Map<Long, String> getSimplePhases(Long projectId) {
        return phaseService.findAllProjectId(projectId).stream()
            .collect(Collectors.toMap(Phase::getId, Phase::getName));
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<UserStatisticDTO> getUsersStatistic(Long projectId) {
        List<TaskForUsers> usersTask = taskForUsersService.findAllByTaskCollectionPhaseProjectId(projectId);
        return usersTask.stream()
            .map(userInfoMapper::toStatisticUser)
            .sorted((prev, next) -> (int) (next.getTotalPoint() - prev.getTotalPoint()))
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public ProjectDetailResponse getProjectDetail(Long projectId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var project = projectRepository.findById(projectId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectMember = project.getProjectUsers().stream()
            .anyMatch(projectRole -> projectRole.getUserInfo()
                .getAccount()
                .getUsername().equals(username));
        var isAssignedUser = taskForUsersService
            .existsByProjectIdAndAssignedUsername(project.getId(), username);

        var canSeeProject = isProjectMember || isAssignedUser;
        if (!canSeeProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return projectMapper.toDetail(project);
    }

    @Override
    public void startProject(Long projectId, String token) {
        Project project = this.getProjectByOwner(projectId, token);

        if (LocalDate.now().isAfter(project.getDueDate()))
            throw new AppExc(ErrorCodes.PROJECT_OVERDUE);

        project.setStartDate(LocalDate.now());
        project.setStatus(ProjectStatus.IN_PROGRESS);
        projectRepository.save(project);
    }

    @Override
    public Map<String, ProjectStatus> switchPauseAndInProgressProject(Long projectId, String token) {
        Project project = this.getProjectByOwner(projectId, token);

        if (project.getStatus().equals(ProjectStatus.IN_PROGRESS))
            project.setStatus(ProjectStatus.PAUSED);

        else if (project.getStatus().equals(ProjectStatus.PAUSED))
            project.setStatus(ProjectStatus.IN_PROGRESS);

        else
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        projectRepository.save(project);
        return Map.of("newStatus", project.getStatus());
    }

    @Override
    public void closeProject(Long projectId, String token) {
        Project project = this.getProjectByOwner(projectId, token);
        //--Close don't have to check every component is completed, or not.

        var isInProgress = project.getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        project.setEndDate(LocalDate.now());
        project.setStatus(ProjectStatus.CLOSED);
        projectRepository.save(project);
    }
}
