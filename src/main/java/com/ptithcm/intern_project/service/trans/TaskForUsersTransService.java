package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskForUsersRepository;
import com.ptithcm.intern_project.service.JwtService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskForUsersTransService {
    TaskForUsersRepository taskForUsersRepository;
    JwtService jwtService;

    @Transactional(rollbackFor = RuntimeException.class)
    public void updateTaskUserStatus(Long taskUserId, String token, UserTaskStatus userTaskStatus) {
        var username = jwtService.readPayload(token).get("sub");
        var foundUserTask = taskForUsersRepository.findById(taskUserId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isTaskOwner = foundUserTask.getTask().getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isTaskOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        foundUserTask.setUserTaskStatus(userTaskStatus);
        taskForUsersRepository.save(foundUserTask);
    }
}
