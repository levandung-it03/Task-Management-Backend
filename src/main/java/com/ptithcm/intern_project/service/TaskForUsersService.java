package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.dto.response.UserTaskResponse;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.enums.Domain;
import com.ptithcm.intern_project.model.enums.ProjectStatus;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import com.ptithcm.intern_project.mapper.ReportMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.dto.request.ReportRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.dto.response.ReportCommentsResponse;
import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.repository.TaskForUsersRepository;
import com.ptithcm.intern_project.service.auth.JwtService;
import com.ptithcm.intern_project.service.interfaces.ITaskForUsersService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskForUsersService implements ITaskForUsersService {
    TaskForUsersRepository taskForUsersRepository;
    UserInfoMapper userInfoMapper;
    UserInfoService userInfoService;
    ReportMapper reportMapper;
    JwtService jwtService;
    ReportService reportService;

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> searchUsersOfRootToCreateSubTask(Long taskId, String query, String tokenOwner) {
        String username = jwtService.readPayload(tokenOwner).get("sub");
        return taskForUsersRepository.fastSearchUsers(taskId, query, username)
            .stream().map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public ArrayList<TaskForUsers> saveAllByEmails(List<String> emails, Task task) {
        var savedRelationships = new ArrayList<>(
            userInfoService.findAllByEmailIn(emails)
            .stream().map(user -> TaskForUsers.builder()
                .task(task)
                .userTaskStatus(UserTaskStatus.JOINED)
                .updatedTime(LocalDateTime.now())
                .assignedUser(user)
                .build()
            ).toList()
        );
        task.getTaskForUsers().addAll(savedRelationships);
        return savedRelationships;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public IdResponse createReport(Long taskUserId, ReportRequest request, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var taskUserCreating = taskForUsersRepository.findById(taskUserId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        var isAssignedUser = taskUserCreating.getTask().getTaskForUsers().stream()
            .anyMatch(userTask -> userTask.getAssignedUser()
                .getAccount().getUsername()
                .equals(username));
        var isKickedOut = taskUserCreating.getUserTaskStatus().equals(UserTaskStatus.KICKED_OUT);
        if (!isAssignedUser || isKickedOut)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        this.validateEndedParentEntities(taskUserCreating);

        var isNotStartedTask = LocalDate.now().isBefore(taskUserCreating.getTask().getStartDate());
        if (isNotStartedTask)   throw new AppExc(ErrorCodes.TASK_HASNT_STARTED);

        var containsApprovedReport = taskUserCreating.getReports()
            .stream().anyMatch(report -> report.getReportStatus().equals(ReportStatus.APPROVED));
        if (containsApprovedReport) throw new AppExc(ErrorCodes.ALREADY_HAS_REPORT_APPROVED);

        var report = reportMapper.newModel(request, taskUserCreating);
        return IdResponse.builder()
            .id(reportService.save(report).getId())
            .build();
    }

    /**
     * PM created Project
     * <br> User created Task
     * <br> User assigned to Task (not kicked one)
     * <p>
     * <br> This one different from {@code .canSeeTask()} that:
     * <br> 1. {@code .canSeeTask()} allow every assignedUsers accessing in Task
     * <br> 2. This method just allow
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ReportCommentsResponse> getReportsAndComments(Long taskUserId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var taskUserAssigned = taskForUsersRepository.findById(taskUserId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        var isProjectOwner = taskUserAssigned.getTask()
            .getCollection()
            .getPhase()
            .getProject()
            .getUserInfoCreated().getAccount().getUsername().equals(username);
        var isTaskOwner = taskUserAssigned.getTask()
            .getUserInfoCreated()
            .getAccount().getUsername().equals(username);
        var isAssignedUser = taskUserAssigned.getAssignedUser().getAccount().getUsername().equals(username);
        var isNotKickedOut = !taskUserAssigned.getUserTaskStatus().equals(UserTaskStatus.KICKED_OUT);

        var canSeeReports = isProjectOwner || isTaskOwner || (isAssignedUser && isNotKickedOut);
        if (!canSeeReports) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var reportList = reportService.findAllByUserTaskCreatedId(taskUserAssigned.getId());

        return reportList.stream()
            .map(reportMapper::toReportComments)
            .toList();
    }

    public void saveAll(List<TaskForUsers> restUsersOfRootTask) {
        taskForUsersRepository.saveAll(restUsersOfRootTask);
    }

    public void save(TaskForUsers newUserTask) {
        taskForUsersRepository.save(newUserTask);
    }

    public List<UserTaskResponse> getAllUsersOfTask(Long taskId) {
        return taskForUsersRepository.findAllByTaskId(taskId);
    }

    public List<Task> findByRootIdAndAssignedUsername(Long rootTaskId, String username) {
        return taskForUsersRepository.findByRootIdAndAssignedUsername(rootTaskId, username);
    }

    public List<UserInfo> searchRootTaskUsers(Long rootId, String query, String username) {
        return taskForUsersRepository.searchTheRestUsersOnRoot(rootId, query, username);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void kickUser(Long taskUserId, String token) {
        String username = jwtService.readPayload(token).get("sub");

        //--Checked project in-progress by "kickedUserTask"
        //--Checked phase is not ended by "reAddedUserTask"
        //--Checked collection is not ended by "reAddedUserTask"
        //--Checked task is not ended by "reAddedUserTask"
        var kickedUserTask = this.findUserTaskByTaskOwner(taskUserId, username);

        if (kickedUserTask.getTask().getRootTask() == null)
            this.rootTaskKickUser(kickedUserTask);
        else
            this.validateSubTaskKickUser(kickedUserTask);

        var isAssignedUserHasReport = reportService.existsReportByUserTaskCreatedId(taskUserId);
        if (isAssignedUserHasReport) {
            kickedUserTask.setUserTaskStatus(UserTaskStatus.KICKED_OUT);
            kickedUserTask.setUpdatedTime(LocalDateTime.now());
            taskForUsersRepository.save(kickedUserTask);
        } else {
            kickedUserTask.getTask().getTaskForUsers().remove(kickedUserTask);
            taskForUsersRepository.deleteById(taskUserId);
        }
    }

    public void rootTaskKickUser(TaskForUsers kickedUserTask) {
        var existsSubTask = taskForUsersRepository.existsSubTaskOfRootTask(kickedUserTask.getTask().getId());
        var isTheLastUser = kickedUserTask.getTask().getTaskForUsers().size() == 1;

        if (isTheLastUser && !existsSubTask)
            throw new AppExc(ErrorCodes.TASK_NEED_AT_LEAST_ONE_USER);
    }

    public void validateSubTaskKickUser(TaskForUsers kickedUserTask) {
        var isTheLastUser = kickedUserTask.getTask().getTaskForUsers().size() == 1;
        if (isTheLastUser)  throw new AppExc(ErrorCodes.TASK_NEED_AT_LEAST_ONE_USER);
    }

    @Override
    public void reAddUser(Long taskUserId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        //--Checked project in-progress by "reAddedUserTask"
        //--Checked phase is not ended by "reAddedUserTask"
        //--Checked collection is not ended by "reAddedUserTask"
        //--Checked task is not ended by "reAddedUserTask"
        var reAddedUserTask = this.findUserTaskByTaskOwner(taskUserId, username);

        reAddedUserTask.setUserTaskStatus(UserTaskStatus.JOINED);
        reAddedUserTask.setUpdatedTime(LocalDateTime.now());

        taskForUsersRepository.save(reAddedUserTask);
    }

    private TaskForUsers findUserTaskByTaskOwner(Long taskUserId, String username) {
        var foundUserTask = taskForUsersRepository.findById(taskUserId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isTaskOwner = foundUserTask.getTask().getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isTaskOwner) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        this.validateEndedParentEntities(foundUserTask);

        var isKickedLeaderProject = ProjectService.isKickedLeader(foundUserTask.getTask(), username);
        if (isKickedLeaderProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return foundUserTask;
    }

    private void validateEndedParentEntities(TaskForUsers taskForUser) {
        var isInProgressProject = taskForUser.getTask().getCollection().getPhase().getProject().getStatus()
            .equals(ProjectStatus.IN_PROGRESS);
        if (!isInProgressProject) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = taskForUser.getTask().getCollection().getPhase().getEndDate() != null;
        if (isPhaseEnded) throw new AppExc(ErrorCodes.PHASE_ENDED);

        var isCollectionEnded = taskForUser.getTask().getCollection().getEndDate() != null;
        if (isCollectionEnded)  throw new AppExc(ErrorCodes.COLLECTION_ENDED);

        var isTaskEnded = taskForUser.getTask().getEndDate() != null;
        if (isTaskEnded)  throw new AppExc(ErrorCodes.TASK_ENDED);
    }

    public boolean existsByProjectIdAndAssignedUsername(Long projectId, String username) {
        return taskForUsersRepository.existsByProjectIdAndAssignedUsername(projectId, username);
    }

    public Optional<UserTaskResponse> getUserOfTask(Long taskId, String username) {
        return taskForUsersRepository.findByTaskIdAndAssignedUsername(taskId, username);
    }

    @Override
    public Map<String, Boolean> checkIsAssignedUserTask(Long taskUserId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        return Map.of(
            "result",
            taskForUsersRepository.existsByTaskUserIdAndAssignedUsername(taskUserId, username)
        );
    }

    public List<TaskForUsers> findAllByTaskCollectionPhaseProjectId(Long projectId) {
        return taskForUsersRepository.findAllByTaskCollectionPhaseProjectId(projectId);
    }

    public List<TaskForUsers> findAllByTaskCollectionPhaseId(Long phaseId) {
        return taskForUsersRepository.findAllByTaskCollectionPhaseId(phaseId);
    }

    public List<TaskForUsers> findAllByTaskCollectionId(Long collectionId) {
        return taskForUsersRepository.findAllByTaskCollectionId(collectionId);
    }

    @Override
    public List<Long> getBusyUserIdsOnTaskType(Domain taskType) {
        return taskForUsersRepository.getBusyUserIdsOnTaskType(taskType);
    }
}
