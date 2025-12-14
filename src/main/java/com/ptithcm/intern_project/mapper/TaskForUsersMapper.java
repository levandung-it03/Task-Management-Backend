package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.dto.response.UserTaskResponse;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
@NoArgsConstructor
public class TaskForUsersMapper {

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public ShortUserInfoDTO shortenTaskUserResponse(UserInfo userInfo) {
        return ShortUserInfoDTO.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .department(userInfo.getDepartment().getName())
            .build();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public UserTaskResponse toResponse(TaskForUsers taskForUsers) {
        return UserTaskResponse.builder()
            .id(taskForUsers.getId())
            .wasDone(!taskForUsers.getReports().isEmpty()
                && taskForUsers.getReports().getLast().getReportStatus().equals(ReportStatus.APPROVED))
            .totalReports(taskForUsers.getReports().size())
            .fullName(taskForUsers.getAssignedUser().getFullName())
            .email(taskForUsers.getAssignedUser().getEmail())
            .department(taskForUsers.getAssignedUser().getDepartment().getName())
            .startedTime(taskForUsers.getStartedTime())
            .role(taskForUsers.getAssignedUser().getAccount().getAuthorities().getFirst().getAuthority())
            .userTaskStatus(taskForUsers.getUserTaskStatus())
            .build();
    }
}
