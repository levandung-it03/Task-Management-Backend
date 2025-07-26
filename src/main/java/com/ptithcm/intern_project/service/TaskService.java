package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.mapper.TaskForUsersMapper;
import com.ptithcm.intern_project.common.mapper.TaskMapper;
import com.ptithcm.intern_project.common.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskRepository;
import com.ptithcm.intern_project.service.trans.TaskTransService;
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
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskService {
    TaskRepository taskRepository;
    UserInfoService userInfoService;
    TaskForUsersService taskForUsersService;
    TaskTransService taskTransService;
    ReportService reportService;
    UserInfoMapper userInfoMapper;
    TaskMapper taskMapper;
    TaskForUsersMapper taskForUsersMapper;
    JwtService jwtService;

    @Transactional(rollbackFor = RuntimeException.class)
    public IdResponse create(TaskRequest request, String token) {
        var userCreated = userInfoService.getUserInfo(token);
        var rootTask = taskMapper.newModel(request, userCreated, null);
        this.validateTask(rootTask);

        var savedRootTask = taskRepository.save(rootTask);
        taskForUsersService.saveAllByEmails(request.getAssignedEmails(), savedRootTask);

        return IdResponse.builder().id(savedRootTask.getId()).build();
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public IdResponse createSubTask(Long rootId, TaskRequest request, String token) {
        var userCreated = userInfoService.getUserInfo(token);
        var rootTask = taskRepository.findById(rootId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (rootTask.getEndDate() != null) {
            throw new AppExc(ErrorCodes.TASK_ENDED);
        }
        if (!rootTask.getUserInfoCreated().getEmail().equals(userCreated.getEmail())) {
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);
        }
        var subTask = taskMapper.newModel(request, userCreated, rootTask);
        this.validateTask(subTask);
        this.validateSubTask(subTask);

        var savedSubTask = taskRepository.save(subTask);
        var subTaskUsersMap = taskForUsersService
            .saveAllByEmails(request.getAssignedEmails(), savedSubTask)
            .stream()
            .collect(Collectors.toMap(rel -> rel.getAssignedUser().getId(), rel -> rel));

        var restUsersOfRootTask = new ArrayList<>(rootTask
            .getTaskForUsers()
            .stream()
            .filter(rel -> !subTaskUsersMap.containsKey(rel.getAssignedUser().getId()))
            .toList()
        );
        rootTask.getTaskForUsers().clear();
        taskForUsersService.deleteAll(rootTask.getTaskForUsers());

        rootTask.setTaskForUsers(restUsersOfRootTask);
        taskForUsersService.saveAll(restUsersOfRootTask);

        return IdResponse.builder().id(savedSubTask.getId()).build();
    }

    private void validateTask(Task task) {
        if (LocalDate.now().isAfter(task.getStartDate()))
            throw new AppExc(ErrorCodes.INVALID_TASK_START_DATE);

        if (task.getStartDate().isAfter(task.getDeadline()))
            throw new AppExc(ErrorCodes.INVALID_TASK_DEADLINE);
    }

    private void validateSubTask(Task task) {
        if (task.getRootTask().getStartDate().isAfter(task.getStartDate()))
            throw new AppExc(ErrorCodes.INVALID_SUB_TASK_START_DATE);

        if (task.getDeadline().isAfter(task.getRootTask().getDeadline()))
            throw new AppExc(ErrorCodes.INVALID_SUB_TASK_DEADLINE);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public TaskResponse get(Long id, String token) {
        var currentUsername = jwtService.readPayload(token).get("sub");
        var foundTask = taskRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isOwner = foundTask.getUserInfoCreated().getAccount().getUsername().equals(currentUsername);
        var canSeeTask = foundTask.getTaskForUsers().stream()
            .anyMatch(rel -> {
                var isAssigned = rel.getAssignedUser().getAccount().getUsername().equals(currentUsername);
                var isValid = !rel.getUserTaskStatus().equals(UserTaskStatus.KICKED_OUT);
                return isAssigned && isValid;
            });
        if (!isOwner || !canSeeTask)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var hasAtLeastOneReport = reportService.hasAtLeastOneReport(id);

        return taskMapper.toResponse(foundTask, hasAtLeastOneReport);
    }

    public void updateDescription(Long id, String description, String token) {
        Task foundTask = taskTransService.findUpdatableTask(id, token);

        foundTask.setDescription(description);
        taskRepository.save(foundTask);
    }

    public void updateReportFormat(Long id, String reportFormat, String token) {
        Task foundTask = taskTransService.findUpdatableTask(id, token);

        foundTask.setReportFormat(reportFormat);
        taskRepository.save(foundTask);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public void update(Long id, UpdatedTaskRequest request, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var updatedTask = taskRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!updatedTask.getUserInfoCreated().getAccount().getUsername().equals(username))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var addedUser = userInfoService.findByAccountUsername(username)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        taskMapper.mappingBaseInfo(updatedTask, request);

        var newUserTask = TaskForUsers.builder()
            .task(updatedTask)
            .assignedUser(addedUser)
            .updatedTime(LocalDateTime.now())
            .userTaskStatus(UserTaskStatus.JOINED)
            .build();
        updatedTask.getTaskForUsers().add(newUserTask);
        taskForUsersService.save(newUserTask);
    }

    public List<ShortUserInfoDTO> getUsersOfTask(Long id, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var task = taskRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!taskTransService.canSeeTask(task, username))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var userInfo = userInfoService.findByAccountUsername(username)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
        if (userInfoService.isEmployee(token))
            return List.of(ShortUserInfoDTO.builder()
                .email(userInfo.getEmail())
                .fullName(userInfo.getFullName())
                .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
                .build());

        return taskForUsersService.getAllUsersOfTask(id);
    }

    public void updateDoneTask(Long id, String token) {
        Task updatedTask = taskTransService.findUpdatableTask(id, token);

        updatedTask.setEndDate(LocalDate.now());
        taskRepository.save(updatedTask);
    }

    public void lockTask(Long id, String token) {
        Task lockedTask = taskTransService.findUpdatableTask(id, token);

        lockedTask.setLocked(true);
        taskRepository.save(lockedTask);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortTaskResponse> getSubTasksOfRootTask(Long rootTaskId, String token) {
        var userInfo = userInfoService
            .findByAccountUsername(jwtService.readPayload(token).get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
        var rootTask = taskRepository.findById(rootTaskId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!taskTransService.canSeeTask(rootTask, token))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isEmployee = userInfo.getAccount()
            .getAuthorities().getFirst()
            .getAuthority().equals(AuthorityEnum.ROLE_EMP.toString());
        if (isEmployee) {
            var assignedUserSubTask = taskForUsersService
                .findByRootIdAndAssignedUsername(rootTaskId, userInfo.getAccount().getUsername())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
            return List.of(taskMapper.shortenTaskResponse(assignedUserSubTask));
        }

        return taskForUsersService.findAllByRootTaskId(rootTaskId)
            .stream().map(taskMapper::shortenTaskResponse)
            .toList();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortUserInfoDTO> searchNewAddedUsersForRootTask(Long rootTaskId, String query, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var isRootTaskOwner = taskRepository.existsByUserInfoCreatedAccountUsername(username);

        if (!isRootTaskOwner)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return userInfoService.fastSearchUsersIgnoreInRootTask(rootTaskId, query)
            .stream().map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortUserInfoDTO> searchRootTaskUsers(Long rootId, String query, String token) {
        var username = jwtService.readPayload(token).get("sub");
        return taskForUsersService.searchRootTaskUsers(rootId, query, username)
            .stream().map(taskForUsersMapper::shortenTaskUserResponse)
            .toList();
    }

}
