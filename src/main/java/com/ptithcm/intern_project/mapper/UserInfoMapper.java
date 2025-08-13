package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.dto.response.UserOverviewResponse;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.model.enums.ReportStatus;
import com.ptithcm.intern_project.jpa.model.enums.TaskLevel;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.util.List;

@Component
@NoArgsConstructor
public class UserInfoMapper {

    public ShortUserInfoDTO shortenUserInfo(UserInfo userInfo) {
        return ShortUserInfoDTO.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .department(userInfo.getDepartment().getName())
            .build();
    }

    public void updateUserInfo(UserInfo originInfo, UpdatedUserInfoRequest dto) {
        originInfo.setFullName(dto.getFullName());
        originInfo.setPhone(dto.getPhone());
        originInfo.setIdentity(dto.getIdentity());
    }

    public UserStatisticDTO toStatisticUser(List<Report> reports) {
        var userInfo = reports.getFirst().getUserTaskCreated().getAssignedUser();
        float totalPoint = 0;
        int totalApproved = 0, totalRejected = 0, totalDoneTaskOnTime = 0, totalDoneTaskLate = 0;

        for (Report report : reports) {
            var task = report.getUserTaskCreated().getTask();

            if (report.getReviewedTime() == null)
                continue;

            if (report.getReportStatus().equals(ReportStatus.REJECTED)) {
                totalRejected++;
                continue;
            } else {
                totalApproved++;
            }

            var reportWasLate = task.getDeadline().atTime(0, 0, 0).isBefore(report.getUpdatedTime());
            if (reportWasLate) {
                totalDoneTaskLate++;
                continue;
            } else {
                totalDoneTaskOnTime++;
            }

            float totalFreeHours = Duration.between(
                task.getDeadline().atTime(0, 0, 0),
                report.getUpdatedTime()
            ).getSeconds() / 3_600f;

            totalPoint = TaskLevel.DEFAULT_POINT
                + (totalFreeHours * TaskLevel.POINT_PER_HOUR)
                + task.getLevel().getTimeRatio();
            totalPoint = Math.max(totalPoint, 0);   //--User just have rejected Tasks
        }

        float approvedRatio = (totalApproved + totalRejected == 0f) ? 0
            : (float) totalApproved / (totalApproved + totalRejected) * 100;
        return UserStatisticDTO.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .role(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .department(userInfo.getDepartment().getName())
            .approvedRatio(approvedRatio)
            .totalPoint(totalPoint)
            .totalDoneTaskOnTime(totalDoneTaskOnTime)
            .totalDoneTaskLate(totalDoneTaskLate)
            .build();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public UserOverviewResponse toOverview(UserInfo userInfo) {
        return UserOverviewResponse.builder()
            .email(userInfo.getEmail())
            .fullName(userInfo.getFullName())
            .phone(userInfo.getPhone())
            .departmentName(userInfo.getDepartment().getName())
            .authorityName(userInfo.getAccount().getAuthorities().getFirst().getAuthority())
            .build();
    }
}
