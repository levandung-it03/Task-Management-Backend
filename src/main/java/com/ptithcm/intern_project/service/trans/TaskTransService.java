package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.enums.ProjectStatus;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.ProjectService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskTransService {
    TaskRepository taskRepository;
    JwtService jwtService;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Task findUpdatableTaskByOwner(Long id, String tokenOwner) {
        String username = jwtService.readPayload(tokenOwner).get("sub");
        var foundTask = this.findTaskByOwner(id, username);

        var isInProgressProject = foundTask
            .getCollection().getPhase().getProject()
            .getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isInProgressProject)   throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = foundTask.getCollection().getPhase().getEndDate() != null;
        if (isPhaseEnded) throw new AppExc(ErrorCodes.PHASE_ENDED);

        var isCollectionEnded = foundTask.getCollection().getEndDate() != null;
        if (isCollectionEnded) throw new AppExc(ErrorCodes.COLLECTION_ENDED);

        if (foundTask.getEndDate() != null)
            throw new AppExc(ErrorCodes.TASK_ENDED);

        var isKickedLeaderProject = ProjectService.isKickedLeader(foundTask, username);
        if (isKickedLeaderProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return foundTask;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Task findTaskByOwner(Long id, String username) {
        var foundTask = taskRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isTaskOwner = foundTask.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isTaskOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return foundTask;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public boolean canSeeTask(Task task, String username) {
        var isTaskOwner = task.getUserInfoCreated().getAccount().getUsername().equals(username);

        //--Project Member absolutely has ProjectRole.ADMIN for PM, and he/she owns Phase, Collection too.
        var isProjectMember = task.getCollection().getPhase().getProject()
            .getProjectUsers().stream()
            .anyMatch(projectUser -> projectUser.getUserInfo().getAccount().getUsername().equals(username));
        return isTaskOwner
            || this.isTaskAssigned(task, username)
            || isProjectMember;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public boolean isTaskAssigned(Task task, String username) {
        var usersTask = new ArrayList<>(task.getTaskForUsers());
        var subTasks = taskRepository.findAllByRootTaskId(task.getId());
        if (!subTasks.isEmpty())
            usersTask.addAll(subTasks.stream()
                .flatMap(subTask -> subTask.getTaskForUsers().stream())
                .toList());
        return usersTask.stream()    //--Task Owner, will own the collection.
            .anyMatch(rel -> {
                var isAssigned = rel.getAssignedUser().getAccount().getUsername().equals(username);
                var isNotKicked = !rel.getUserTaskStatus().equals(UserTaskStatus.KICKED_OUT);
                return isAssigned && isNotKicked;
            });
    }
}
