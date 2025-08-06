package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.response.UserTaskResponse;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.mapper.ReportMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.ReportRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.ReportCommentsResponse;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskForUsersRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.ITaskForUsersService;
import com.ptithcm.intern_project.service.trans.TaskForUsersTransService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskForUsersService implements ITaskForUsersService {
    TaskForUsersRepository taskForUsersRepository;
    UserInfoMapper userInfoMapper;
    UserInfoService userInfoService;
    TaskForUsersTransService taskForUsersTransService;
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
        task.setTaskForUsers(savedRelationships);
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

        var isProjectActive = taskUserCreating.getTask().getCollection().getPhase().getProject().isActive();
        if (!isProjectActive)   throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        var isNotStartedTask = LocalDate.now().isBefore(taskUserCreating.getTask().getStartDate());
        if (isNotStartedTask)   throw new AppExc(ErrorCodes.TASK_HASNT_STARTED);

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

    public void deleteAll(List<TaskForUsers> taskForUsers) {
        taskForUsersRepository.deleteAll(taskForUsers);
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

    public Optional<Task> findByRootIdAndAssignedUsername(Long rootTaskId, String username) {
        return taskForUsersRepository.findByRootIdAndAssignedUsername(rootTaskId, username);
    }

    public List<UserInfo> searchRootTaskUsers(Long rootId, String query, String username) {
        return taskForUsersRepository.searchTheRestUsersOnRoot(rootId, query, username);
    }

    public void kickUser(Long taskUserId, String token) {
        taskForUsersTransService.updateTaskUserStatus(taskUserId, token, UserTaskStatus.KICKED_OUT);
    }

    public void reAddUser(Long taskUserId, String token) {
        taskForUsersTransService.updateTaskUserStatus(taskUserId, token, UserTaskStatus.JOINED);
    }

    public boolean existsByProjectIdAndAssignedUsername(Long projectId, String username) {
        return taskForUsersRepository.existsByProjectIdAndAssignedUsername(projectId, username);
    }

    public UserTaskResponse getUserOfTask(Long taskId, String username) {
        return taskForUsersRepository.findByTaskIdAndAssignedUsername(taskId, username);
    }
}
