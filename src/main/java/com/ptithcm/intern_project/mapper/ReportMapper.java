package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.request.ReportRequest;
import com.ptithcm.intern_project.dto.response.ReportCommentsResponse;
import com.ptithcm.intern_project.dto.response.ReportResponse;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.ReportStatus;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@AllArgsConstructor
public class ReportMapper {
    private final CommentOfReportMapper commentOfReportMapper;
    UserInfoMapper userInfoMapper;

    public Report newModel(ReportRequest request, TaskForUsers taskUserCreating) {
        return Report.builder()
            .userTaskCreated(taskUserCreating)
            .title(request.getTitle())
            .content(request.getContent())
            .rejectedReason(null)
            .reportStatus(ReportStatus.WAITING)
            .reviewedTime(null)
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .build();
    }

    public ReportCommentsResponse toReportComments(Report report) {
        var commentList = report.getCommentOfReports().stream()
            .map(commentOfReportMapper::toResponse)
            .toList();
        return ReportCommentsResponse.builder()
            .report(this.toResponse(report))
            .comments(commentList)
            .build();
    }

    public ReportResponse toResponse(Report report) {
        var assignedUser = userInfoMapper.shortenUserInfo(report.getUserTaskCreated().getAssignedUser());
        return ReportResponse.builder()
            .id(report.getId())
            .title(report.getTitle())
            .content(report.getContent())
            .createdBy(assignedUser)
            .reportStatus(report.getReportStatus())
            .rejectedReason(report.getRejectedReason())
            .reviewedTime(report.getReviewedTime())
            .createdTime(report.getCreatedTime())
            .updatedTime(report.getUpdatedTime())
            .build();
    }
}
