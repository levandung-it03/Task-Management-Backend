package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.dto.general.StatusDTO;
import com.ptithcm.intern_project.dto.response.UserTaskResponse;
import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.mapper.TaskForUsersMapper;
import com.ptithcm.intern_project.mapper.TaskMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.general.TaskCreationDTO;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.ITaskService;
import com.ptithcm.intern_project.service.messages.GroupMsg;
import com.ptithcm.intern_project.service.messages.TaskMsg;
import com.ptithcm.intern_project.service.supports.EmailQueueService;
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
public class TaskService implements ITaskService {
    TaskRepository taskRepository;
    UserInfoService userInfoService;
    TaskForUsersService taskForUsersService;
    TaskTransService taskTransService;
    ReportService reportService;
    UserInfoMapper userInfoMapper;
    TaskMapper taskMapper;
    TaskForUsersMapper taskForUsersMapper;
    JwtService jwtService;
    EmailQueueService emailQueueService;

    @Transactional(rollbackFor = RuntimeException.class)
    public IdResponse create(Collection collection, TaskRequest request, String token) {
        var isProjectActive = collection.getPhase().getProject().isActive();
        if (!isProjectActive) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        var userCreated = userInfoService.getUserInfo(token);
        var isProjectMemberOrAdmin = collection.getPhase().getProject()
            .getProjectUsers()
            .stream().anyMatch(projectRole ->
                projectRole.getUserInfo().getEmail().equals(userCreated.getEmail())
            );
        if (!isProjectMemberOrAdmin) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var rootTask = taskMapper.newModel(TaskCreationDTO.builder()
            .collectionOfTask(collection)
            .request(request)
            .userInfo(userCreated)
            .rootTask(null)
            .build());
        this.validateTask(rootTask);
        var savedRootTask = taskRepository.save(rootTask);
        var usersTaskList = taskForUsersService.saveAllByEmails(request.getAssignedEmails(), savedRootTask);

        this.notifyViaEmail(usersTaskList, TaskMsg.ASSIGNED_TO_TASK);

        return IdResponse.builder().id(savedRootTask.getId()).build();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public IdResponse createSubTask(Long rootId, TaskRequest request, String token) {
        var userCreated = userInfoService.getUserInfo(token);
        var rootTask = taskRepository.findById(rootId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var taskWasEnded = rootTask.getEndDate() != null;
        if (taskWasEnded) throw new AppExc(ErrorCodes.TASK_ENDED);

        var isRootTaskOwner = rootTask.getUserInfoCreated().getEmail().equals(userCreated.getEmail());
        if (!isRootTaskOwner) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isKickedLeaderProject = ProjectService.isKickedLeader(rootTask, userCreated.getAccount().getUsername());
        if (isKickedLeaderProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var existsReportOnUsers = reportService.existsByEmailsInAndTaskId(request.getAssignedEmails(), rootTask.getId());
        if (existsReportOnUsers) throw new AppExc(ErrorCodes.AT_LEAST_ONE_REPORT_ON_TASK);

        var subTask = taskMapper.newModel(TaskCreationDTO.builder()
            .collectionOfTask(rootTask.getCollection())
            .request(request)
            .userInfo(userCreated)
            .rootTask(rootTask)
            .build());
        this.validateTask(subTask);
        this.validateSubTask(subTask);

        var savedSubTask = taskRepository.save(subTask);
        var subTaskUsersMap = taskForUsersService
            .saveAllByEmails(request.getAssignedEmails(), savedSubTask)
            .stream()
            .collect(Collectors.toMap(rel -> rel.getAssignedUser().getId(), rel -> rel));

        var removedUsersOfRootTask = rootTask
            .getTaskForUsers()
            .stream()
            .filter(rel -> subTaskUsersMap.containsKey(rel.getAssignedUser().getId()))
            .toList();
        rootTask.getTaskForUsers().removeAll(removedUsersOfRootTask);
        taskRepository.save(rootTask);

        this.notifyViaEmail(removedUsersOfRootTask, TaskMsg.MOVED_TO_SUB_TASK);

        return IdResponse.builder().id(savedSubTask.getId()).build();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public TaskResponse get(Long id, String token) {
        var currentUsername = jwtService.readPayload(token).get("sub");
        var foundTask = taskRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!this.taskTransService.canSeeTask(foundTask, currentUsername))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var hasAtLeastOneReport = reportService.hasAtLeastOneReport(id);
        return taskMapper.toResponse(foundTask, hasAtLeastOneReport);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void updateDescription(Long id, String description, String token) {
        Task foundTask = taskTransService.findUpdatableTaskByOwner(id, token);

        var existsDoneReport = reportService.existsReportByTaskId(id);
        if (existsDoneReport) throw new AppExc(ErrorCodes.AT_LEAST_ONE_REPORT_ON_TASK);

        foundTask.setDescription(description);
        foundTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(foundTask);

        this.notifyViaEmail(foundTask.getTaskForUsers(), TaskMsg.UPDATED_TASK_DESC);
    }

    @Override
    public void updateReportFormat(Long id, String reportFormat, String token) {
        Task foundTask = taskTransService.findUpdatableTaskByOwner(id, token);

        var existsDoneReport = reportService.existsReportByTaskId(id);
        if (existsDoneReport) throw new AppExc(ErrorCodes.AT_LEAST_ONE_REPORT_ON_TASK);

        foundTask.setReportFormat(reportFormat);
        foundTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(foundTask);

        this.notifyViaEmail(foundTask.getTaskForUsers(), TaskMsg.UPDATED_TASK_REPORT_FORMAT);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public void update(Long id, UpdatedTaskRequest request, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var foundTask = taskTransService.findTaskByOwner(id, username);

        var existsDoneReport = reportService.existsReportByTaskId(id);
        if (existsDoneReport) throw new AppExc(ErrorCodes.AT_LEAST_ONE_REPORT_ON_TASK);

        taskMapper.mappingBaseInfo(foundTask, request);

        if (request.getAddedUserEmail() != null && !request.getAddedUserEmail().isEmpty()) {
            var addedUser = userInfoService.findByEmail(request.getAddedUserEmail())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_EMAIL));
            var newUserTask = TaskForUsers.builder()
                .task(foundTask)
                .assignedUser(addedUser)
                .updatedTime(LocalDateTime.now())
                .userTaskStatus(UserTaskStatus.JOINED)
                .build();
            foundTask.getTaskForUsers().add(newUserTask);
            taskForUsersService.save(newUserTask);
        }
        foundTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(foundTask);
    }

    @Override
    public List<UserTaskResponse> getUsersOfTask(Long taskId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var task = taskRepository.findById(taskId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!taskTransService.canSeeTask(task, username))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var userInfo = userInfoService.findByAccountUsername(username)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        var currentAuthority = userInfo.getAccount().getAuthorities().getFirst().getAuthority();
        if (currentAuthority.equals(AuthorityEnum.ROLE_EMP.toString())) {
            var justAssignedEmployee = taskForUsersService.getUserOfTask(taskId, username);
            return justAssignedEmployee.map(List::of).orElseGet(List::of);
        }
        return taskForUsersService.getAllUsersOfTask(taskId);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void updateDoneTask(Long id, String token) {
        Task updatedTask = taskTransService.findUpdatableTaskByOwner(id, token);

        var isNotStartedTask = LocalDate.now().isBefore(updatedTask.getStartDate());
        if (isNotStartedTask) throw new AppExc(ErrorCodes.TASK_HASNT_STARTED);

        var isUndoneTaskViaReport = taskRepository.existsUndoneTaskByIdViaReport(id);
        if (isUndoneTaskViaReport) throw new AppExc(ErrorCodes.CANNOT_DONE_TASK);

        var isUndoneTaskViaSubTask = taskRepository.existsUndoneTaskByIdViaSubTask(id);
        if (isUndoneTaskViaSubTask) throw new AppExc(ErrorCodes.CANNOT_DONE_TASK);

        updatedTask.setEndDate(LocalDate.now());
        updatedTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(updatedTask);

        this.notifyViaEmail(updatedTask.getTaskForUsers(), TaskMsg.COMPLETED_TASK);
    }

    @Override
    public void updateLockedStatusTask(Long id, StatusDTO request, String token) {
        Task lockedTask = taskTransService.findUpdatableTaskByOwner(id, token);

        lockedTask.setLocked(request.isStatus());
        taskRepository.save(lockedTask);

        this.notifyViaEmail(lockedTask.getTaskForUsers(), TaskMsg.LOCKED_TASK);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortTaskResponse> getSubTasksOfRootTask(Long rootTaskId, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var rootTask = taskRepository.findById(rootTaskId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isSubTaskQuerying = rootTask.getRootTask() != null;
        if (isSubTaskQuerying) return List.of();

        var userInfo = userInfoService
            .findByAccountUsername(jwtService.readPayload(token).get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        var isTaskOwner = rootTask.getUserInfoCreated().getAccount().getUsername().equals(username);
        var isAssignedUser = taskTransService.isTaskAssigned(rootTask, username);
        //--Project Member absolutely has ProjectRole.ADMIN for PM, and he/she owns Phase, Collection too.
        var isProjectMember = rootTask.getCollection().getPhase().getProject()
            .getProjectUsers().stream()
            .anyMatch(projectUser -> projectUser.getUserInfo().getAccount().getUsername().equals(username));
        var canSeeTask = isTaskOwner || isProjectMember || isAssignedUser;
        if (!canSeeTask) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        if (isAssignedUser) {
            return taskForUsersService
                .findByRootIdAndAssignedUsername(rootTaskId, userInfo.getAccount().getUsername())
                .stream().map(taskMapper::shortenTaskResponse)
                .toList();
        }
        return taskRepository.findAllByRootTaskId(rootTaskId)
            .stream().map(taskMapper::shortenTaskResponse)
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortUserInfoDTO> searchNewAddedUsersForRootTask(Long rootTaskId, String query, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var curUserInfo = userInfoService.getUserInfo(token);

        var isRootTaskOwner = taskRepository.existsByUserInfoCreatedAccountUsername(username);
        if (!isRootTaskOwner) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var foundUsers = userInfoService.fastSearchUsersIgnoreInRootTask(rootTaskId, query);
        foundUsers.remove(curUserInfo);

        var curAuthority = curUserInfo.getAccount().getAuthorities().getFirst().getName();
        if (curAuthority.equals(AuthorityEnum.ROLE_PM.toString()))
            return foundUsers.stream().map(userInfoMapper::shortenUserInfo).toList();

        if (curAuthority.equals(AuthorityEnum.ROLE_LEAD.toString()))
            return foundUsers.stream()
                .filter(userInfo -> userInfo.getAccount()
                    .getAuthorities().getFirst()
                    .getName().equals(AuthorityEnum.ROLE_EMP.toString())
                ).map(userInfoMapper::shortenUserInfo).toList();

        throw new AppExc(ErrorCodes.FORBIDDEN_USER);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortUserInfoDTO> searchRootTaskUsers(Long rootId, String query, String token) {
        String username = jwtService.readPayload(token).get("sub");
        return taskForUsersService.searchRootTaskUsers(rootId, query, username)
            .stream().map(taskForUsersMapper::shortenTaskUserResponse)
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<ShortTaskResponse> getAllRelatedUndoneTasks(String token) {
        String username = jwtService.readPayload(token).get("sub");
        var resultList = new ArrayList<Task>();

        resultList.addAll(taskRepository.findAllCreatedAndUndoneByUsername(username));
        resultList.addAll(taskRepository.findAllAssignedAndUndoneByUsername(username));

        return resultList.stream().map(taskMapper::shortenTaskResponse).toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void delete(Long id, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var task = taskRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isOwner = task.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var hasValidTimeForDeletion = task.getCreatedTime().plusHours(12).isAfter(LocalDateTime.now());
        if (!hasValidTimeForDeletion) throw new AppExc(ErrorCodes.TASK_CREATED_IN_LENGTHY_TIME);

        var existsReportOnUsers = reportService.existsByEmailsInAndTaskId(
            task.getTaskForUsers().stream().map(userTask -> userTask.getAssignedUser().getEmail()).toList(),
            task.getId());
        if (existsReportOnUsers) throw new AppExc(ErrorCodes.AT_LEAST_ONE_REPORT_ON_TASK);

        if (task.getRootTask() != null)
            this.deleteSubTask(task);
        else
            this.deleteRootTask(task);

        this.notifyViaEmail(task.getTaskForUsers(), TaskMsg.DELETED_TASK);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void deleteRootTask(Task task) {
        task.getTaskForUsers().clear();
        taskRepository.delete(task);    //--Has orphanRemoval delete relationships
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void deleteSubTask(Task subTask) {
        var rootTask = subTask.getRootTask();
        assert rootTask != null;

        var usersSubTask = subTask.getTaskForUsers().stream()
            .peek(userTask -> userTask.setTask(rootTask))
            .toList();
        rootTask.getTaskForUsers().addAll(usersSubTask);
        taskForUsersService.saveAll(rootTask.getTaskForUsers());

        subTask.getTaskForUsers().clear();
        taskRepository.delete(subTask);    //--Has orphanRemoval delete relationships
    }

    public boolean existsByCollectionId(Long id) {
        return taskRepository.existsByCollectionId(id);
    }

    public List<Task> getAllRelatedTasks(Collection collection, String token) {
        String username = jwtService.readPayload(token).get("sub");
        return taskRepository.findAllByRelatedByCollectionIdAndUsername(collection.getId(), username);
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

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void notifyViaEmail(List<TaskForUsers> userTasks, TaskMsg msgEnum) {
        var task = userTasks.getFirst().getTask();
        for (var userTask : userTasks)
            emailQueueService.addToQueue(EmailTaskDTO.builder()
                .to(userTask.getAssignedUser().getEmail())
                .subject(msgEnum.getSubject())
                .body(msgEnum.format(
                    task.getName(),
                    task.getCollection().getName(),
                    task.getCollection().getPhase().getName(),
                    task.getCollection().getPhase().getProject().getName()
                ))
                .build());
    }
}
