package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.jpa.model.Project;
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
public class PhaseTransService {
    TaskForUsersService taskForUsersService;;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public boolean canSeePhases(Project projectContainer, String username) {
        var isProjectMemberOrAdmin = projectContainer.getProjectUsers().stream()
            .anyMatch(projectRole -> projectRole.getUserInfo()
                .getAccount()
                .getUsername().equals(username));
        var isAssignedUserTaskOfProject = taskForUsersService
            .existsByProjectIdAndAssignedUsername(projectContainer.getId(), username);
        return isProjectMemberOrAdmin || isAssignedUserTaskOfProject;
    }
}
