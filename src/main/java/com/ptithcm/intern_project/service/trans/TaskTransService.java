package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Task;
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
        if (foundTask.getEndDate() != null)
            throw new AppExc(ErrorCodes.TASK_ENDED);

        var isRootTaskOwner = foundTask.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isRootTaskOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isKickedLeaderProject = ProjectService.isKickedLeader(foundTask, username);
        if (isKickedLeaderProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return foundTask;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Task findTaskByOwner(Long id, String username) {
        var foundTask = taskRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isTaskOwner = foundTask.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isTaskOwner)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return foundTask;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public boolean canSeeTask(Task task, String username) {
        var isTaskOwner = task.getUserInfoCreated().getAccount().getUsername().equals(username);
        var isTaskAssigned = task.getTaskForUsers().stream()    //--Task Owner, will own the collection.
            .anyMatch(rel -> {
                var isAssigned = rel.getAssignedUser().getAccount().getUsername().equals(username);
                var isNotKicked = !rel.getUserTaskStatus().equals(UserTaskStatus.KICKED_OUT);
                return isAssigned && isNotKicked;
            });
        //--Project Member absolutely has ProjectRole.ADMIN for PM, and he/she owns Phase, Collection too.
        var isProjectMember = task.getCollection().getPhase().getProject()
            .getProjectUsers().stream()
            .anyMatch(projectUser -> projectUser.getUserInfo().getAccount().getUsername().equals(username));
        return isTaskOwner
            || isTaskAssigned
            || isProjectMember;
    }
}
