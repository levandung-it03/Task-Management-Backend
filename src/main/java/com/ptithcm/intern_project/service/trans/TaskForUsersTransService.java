package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.ProjectStatus;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskForUsersRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.ProjectService;
import com.ptithcm.intern_project.service.TaskForUsersService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskForUsersTransService {
    TaskForUsersRepository taskForUsersRepository;
    JwtService jwtService;

    @Transactional(rollbackFor = RuntimeException.class)
    public TaskForUsers updateTaskUserStatus(Long taskUserId, String token, UserTaskStatus userTaskStatus) {
        String username = jwtService.readPayload(token).get("sub");
        var foundUserTask = taskForUsersRepository.findById(taskUserId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isTaskOwner = foundUserTask.getTask().getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isTaskOwner) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        this.validateEndedParentEntities(foundUserTask);

        var isKickedLeaderProject = ProjectService.isKickedLeader(foundUserTask.getTask(), username);
        if (isKickedLeaderProject) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        foundUserTask.setUserTaskStatus(userTaskStatus);
        foundUserTask.setUpdatedTime(LocalDateTime.now());

        return foundUserTask;
    }

    public void validateEndedParentEntities(TaskForUsers taskForUser) {
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
}
