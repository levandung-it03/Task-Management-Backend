package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskRepository;
import com.ptithcm.intern_project.service.JwtService;
import com.ptithcm.intern_project.service.TaskForUsersService;
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
    public Task findUpdatableTask(Long id, String tokenOwner) {
        var username = jwtService.readPayload(tokenOwner).get("sub");
        var foundTask = taskRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (!foundTask.getUserInfoCreated().getAccount().getUsername().equals(username))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        if (foundTask.getEndDate() != null)
            throw new AppExc(ErrorCodes.TASK_ENDED);

        return foundTask;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public boolean canSeeTask(Task task, String username) {
        var isTaskOwner = task.getUserInfoCreated().getAccount().getUsername().equals(username);
        var isTaskAssigned = task.getTaskForUsers().stream()
            .anyMatch(rel -> {
                var isAssigned = rel.getAssignedUser().getAccount().getUsername().equals(username);
                var isNotKicked = !rel.getUserTaskStatus().equals(UserTaskStatus.KICKED_OUT);
                return isAssigned && isNotKicked;
            });
        var isCollectionOwner = task.getCollection()
            .getUserInfoCreated().getAccount().getUsername().equals(username);
        var isPhaseOwner = task.getCollection().getPhase()
            .getUserInfoCreated().getAccount().getUsername().equals(username);
        var isProjectOwner = task.getCollection().getPhase().getProject()
            .getUserInfoCreated().getAccount().getUsername().equals(username);
        var isProjectMember = task.getCollection().getPhase().getProject()
            .getProjectUsers().stream()
            .anyMatch(projectUser -> projectUser.getUserInfo().getAccount().getUsername().equals(username));
        return isTaskOwner
            || isTaskAssigned
            || isCollectionOwner
            || isPhaseOwner
            || isProjectOwner
            || isProjectMember;
    }
}
