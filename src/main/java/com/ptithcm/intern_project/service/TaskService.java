package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.model.dto.general.StatusDTO;
import com.ptithcm.intern_project.model.dto.response.*;
import com.ptithcm.intern_project.model.enums.RoleOnEntity;
import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.mapper.TaskForUsersMapper;
import com.ptithcm.intern_project.mapper.TaskMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.model.dto.general.TaskCreationDTO;
import com.ptithcm.intern_project.model.dto.request.TaskRequest;
import com.ptithcm.intern_project.model.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.Collection;
import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.repository.TaskRepository;
import com.ptithcm.intern_project.service.auth.JwtService;
import com.ptithcm.intern_project.service.interfaces.ITaskService;
import com.ptithcm.intern_project.service.email.messages.TaskMsg;
import com.ptithcm.intern_project.service.email.EmailQueueService;
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
import java.util.Optional;
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
        var isPhaseEnded = collection.getPhase().getEndDate() != null;
        if (isPhaseEnded) throw new AppExc(ErrorCodes.PHASE_ENDED);

        var isCollectionEnded = collection.getEndDate() != null;
        if (isCollectionEnded) throw new AppExc(ErrorCodes.PHASE_ENDED);

        var userCreated = userInfoService.getUserInfo(token);
        var isProjectMemberOrAdmin = collection.getPhase().getProject()
            .getProjectUsers()
            .stream().anyMatch(projectRole ->
                projectRole.getUserInfo().getEmail().equals(userCreated.getEmail())
            );
        if (!isProjectMemberOrAdmin) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var existsTaskName = taskRepository.existsByNameAndCollectionId(request.getName(), collection.getId());
        if (existsTaskName) throw new AppExc(ErrorCodes.DUPLICATED_NAME);

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
        var rootTask = taskTransService.findUpdatableTaskByOwner(rootId, token);
        //--Checked project in-progress by "rootTask"
        //--Checked phase is ended by "rootTask"
        //--Checked collection is ended by "rootTask"
        //--Checked task is ended by "rootTask"

        var isStartingBeforeRootTask = request.getStartDate().isBefore(rootTask.getStartDate());
        if (isStartingBeforeRootTask)    throw new AppExc(ErrorCodes.START_BEFORE_ROOT_TASK);

        var isEndingAfterSubTask = request.getDeadline().isAfter(rootTask.getDeadline());
        if (isEndingAfterSubTask)    throw new AppExc(ErrorCodes.END_AFTER_COLLECTION);

        var isRootTaskOwner = rootTask.getUserInfoCreated().getEmail().equals(userCreated.getEmail());
        if (!isRootTaskOwner) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isKickedLeaderProject = ProjectService.isKickedLeader(rootTask, userCreated.getAccount().getUsername());
        if (isKickedLeaderProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var existsReportOnUsers = reportService.existsByEmailsInAndTaskId(request.getAssignedEmails(), rootTask.getId());
        if (existsReportOnUsers) throw new AppExc(ErrorCodes.USER_SUBMITTED_REPORT);

        var existsTaskName = taskRepository.existsByNameAndCollectionId(request.getName(), rootTask.getCollection().getId());
        if (existsTaskName) throw new AppExc(ErrorCodes.DUPLICATED_NAME);

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
        var foundTask = this.findUpdatableTaskNotHasReport(id, token);
        //--Checked project in-progress by "rootTask"
        //--Checked phase is ended by "rootTask"
        //--Checked collection is ended by "rootTask"
        //--Checked task is ended by "rootTask"

        foundTask.setDescription(description);
        foundTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(foundTask);

        this.notifyViaEmail(foundTask.getTaskForUsers(), TaskMsg.UPDATED_TASK_DESC);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void updateReportFormat(Long id, String reportFormat, String token) {
        Task foundTask = this.findUpdatableTaskNotHasReport(id, token);

        foundTask.setReportFormat(reportFormat);
        foundTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(foundTask);

        this.notifyViaEmail(foundTask.getTaskForUsers(), TaskMsg.UPDATED_TASK_REPORT_FORMAT);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public UpdatedTaskResponse update(Long id, UpdatedTaskRequest request, String token) {
        var result = UpdatedTaskResponse.builder().build();
        var foundTask = this.findUpdatableTaskNotHasReport(id, token);

        var isStartingBeforeCollection = request.getStartDate().isBefore(foundTask.getCollection().getStartDate());
        if (isStartingBeforeCollection)    throw new AppExc(ErrorCodes.START_BEFORE_COLLECTION);

        var isEndingAfterCollection = request.getDeadline().isAfter(foundTask.getCollection().getDueDate());
        if (isEndingAfterCollection)    throw new AppExc(ErrorCodes.END_AFTER_COLLECTION);

        var subTasks = taskRepository.findAllByRootTaskId(id);
        for (Task subTask : subTasks) {
            if (request.getStartDate().isAfter(subTask.getStartDate()))
                throw new AppExc(ErrorCodes.START_AFTER_SUB_TASK);
            if (request.getDeadline().isBefore(subTask.getDeadline()))
                throw new AppExc(ErrorCodes.END_BEFORE_SUB_TASK);
        }
        taskMapper.mappingBaseInfo(foundTask, request);

        if (foundTask.getRootTask() == null
            && request.getAddedUserEmail() != null
            && !request.getAddedUserEmail().isEmpty()
        ) {
            var addedUser = userInfoService.findByEmail(request.getAddedUserEmail())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_EMAIL));
            var newUserTask = TaskForUsers.builder()
                .task(foundTask)
                .assignedUser(addedUser)
                .updatedTime(LocalDateTime.now())
                .userTaskStatus(UserTaskStatus.JOINED)
                .build();
            foundTask.getTaskForUsers().add(newUserTask);
            var addedResult = taskForUsersService.save(newUserTask);
            result.setNewUsers(List.of(taskForUsersMapper.toResponse(addedResult)));
        }
        foundTask.setUpdatedTime(LocalDateTime.now());
        taskRepository.save(foundTask);
        return result;
    }

    private Task findUpdatableTaskNotHasReport(Long id, String token) {
        Task foundTask = taskTransService.findUpdatableTaskByOwner(id, token);
        //--Checked project in-progress by "foundTask"
        //--Checked phase is ended by "foundTask"
        //--Checked collection is ended by "foundTask"
        //--Checked task is ended by "foundTask"

        var existsDoneReport = reportService.existsReportByTaskId(id);
        if (existsDoneReport) throw new AppExc(ErrorCodes.EXISTS_REPORT_ON_TASK);

        return foundTask;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    @Override
    public List<UserTaskResponse> getUsersOfTask(Long taskId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var task = taskRepository.findById(taskId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!taskTransService.canSeeTask(task, username))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isTaskOwner = task.getUserInfoCreated().getAccount().getUsername().equals(username);
        var isAssignedUser = task.getTaskForUsers().stream()
            .anyMatch(userTask -> userTask.getAssignedUser().getAccount().getUsername().equals(username));
        if (isAssignedUser && !isTaskOwner) {
            var justAssignedUser = taskForUsersService.getUserOfTask(taskId, username);
            return justAssignedUser
                .map(taskForUsers -> List.of(taskForUsersMapper.toResponse(taskForUsers)))
                .orElseGet(List::of);
        }
        var queryResult = taskForUsersService.getAllUsersOfTask(taskId);
        return queryResult.stream().map(taskForUsersMapper::toResponse).toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void updateDoneTask(Long id, String token) {
        Task updatedTask = taskTransService.findUpdatableTaskByOwner(id, token);
        //--Checked project in-progress by "updatedTask"
        //--Checked phase is ended by "updatedTask"
        //--Checked collection is ended by "updatedTask"
        //--Checked task is ended by "updatedTask"

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
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void updateLockedStatusTask(Long id, StatusDTO request, String token) {
        Task lockedTask = taskTransService.findUpdatableTaskByOwner(id, token);
        //--Checked project in-progress by "lockedTask"
        //--Checked phase is ended by "lockedTask"
        //--Checked collection is ended by "lockedTask"
        //--Checked task is ended by "lockedTask"

        lockedTask.setLocked(request.getStatus());
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
        var isProjectOwner = rootTask.getCollection().getPhase().getProject()
            .getUserInfoCreated().getAccount().getUsername().equals(username);

        var canSeeTask = isTaskOwner || isProjectOwner || isAssignedUser;
        if (!canSeeTask) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        if (isTaskOwner || isProjectOwner) {
            return taskRepository.findAllByRootTaskId(rootTaskId)
                .stream().map(taskMapper::shortenTaskResponse)
                .toList();
        }
        return taskForUsersService
            .findByRootIdAndAssignedUsername(rootTaskId, userInfo.getAccount().getUsername())
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
    public SuccessCodes delete(Long id, String token) {
        var task = taskTransService.findUpdatableTaskByOwner(id, token);
        //--Checked project is in-progress by "task"
        //--Checked phase is ended by "task"
        //--Checked collection is ended by "task"
        //--Checked task is ended by "task"

        var hasValidTimeForDeletion = task.getCreatedTime().plusHours(12).isAfter(LocalDateTime.now());
        if (!hasValidTimeForDeletion) throw new AppExc(ErrorCodes.TASK_CREATED_IN_LENGTHY_TIME);

        var copiedTaskForUsers = new ArrayList<>(task.getTaskForUsers());
        var existsReportOnUsers = reportService.existsByEmailsInAndTaskId(
            task.getTaskForUsers().stream().map(userTask -> userTask.getAssignedUser().getEmail()).toList(),
            task.getId());
        if (existsReportOnUsers) throw new AppExc(ErrorCodes.EXISTS_REPORT_ON_TASK);

        SuccessCodes returnMsg;
        if (task.getRootTask() != null) {
            this.deleteSubTask(task);
            returnMsg = SuccessCodes.DELETED_SUB_TASK;
        } else {
            this.deleteRootTask(task);
            returnMsg = SuccessCodes.DELETED;
        }

        this.notifyViaEmail(copiedTaskForUsers, TaskMsg.DELETED_TASK);
        return returnMsg;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void deleteRootTask(Task task) {
        Optional<Task> subTask = taskRepository.findByRootTaskId(task.getId());
        if (subTask.isPresent())    taskRepository.delete(subTask.get());

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

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<Task> getAllRelatedTasks(Collection collection, String token) {
        String username = jwtService.readPayload(token).get("sub");
        return taskRepository
            .findAllDistinctByCollectionId(collection.getId())
            .stream().filter(task -> {
                var isOwner = task.getUserInfoCreated().getAccount().getUsername().equals(username);
                var isRelatedPM = task.getCollection().getPhase().getProject().getProjectUsers()
                    .stream().anyMatch(projectRole ->
                        projectRole.getUserInfo().getAccount().getUsername().equals(username)
                            && projectRole.getRole().equals(RoleOnEntity.OWNER)
                    );     //--May be just Project Manager (but this code will be used in the future).
                var isAssignedUser = task.getTaskForUsers().stream()
                    .anyMatch(userTask -> userTask.getAssignedUser()
                        .getAccount()
                        .getUsername().equals(username));
                return isOwner || isRelatedPM || isAssignedUser;
            })
            .map(task -> task.getRootTask() == null ? task : task.getRootTask())
            .collect(Collectors.toSet())
            .stream()
            .toList();
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

    public int countAllInProjectDoneOnTime(Long projectId) {
        return taskRepository.countAllInProjectDoneOnTime(projectId);
    }

    public int countAllInProjectLate(Long projectId) {
        return taskRepository.countAllInProjectLate(projectId);
    }

    public boolean existsTaskNotCompletedByCollectionId(Long collectionId) {
        return taskRepository.existsTaskNotCompletedByCollectionId(collectionId);
    }

    @Override
    public TaskDetailResponse getRootTaskDetail(Long taskId, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var task = taskRepository.findById(taskId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeeTask = taskTransService.canSeeTask(task, username);
        if (!canSeeTask)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return taskMapper.toDetail(task);
    }

    @Override
    public TaskDelegatorResponse getTaskDelegator(Long taskId, String token) {
        var username = jwtService.readPayload(token).get("sub");
        var task = taskRepository.findById(taskId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeeTask = taskTransService.canSeeTask(task, username);
        if (!canSeeTask)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return taskMapper.toDelegator(task);
    }

    public List<Task> findAllByCollectionId(Long id) {
        return taskRepository.findAllByCollectionId(id);
    }
}
