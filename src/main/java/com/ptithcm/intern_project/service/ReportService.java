package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.model.enums.ReportStatus;
import com.ptithcm.intern_project.jpa.repository.ReportRepository;
import com.ptithcm.intern_project.service.trans.ReportTransService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportService {
    ReportRepository reportRepository;
    CommentOfReportService commentOfReportService;
    ReportTransService reportTransService;
    JwtService jwtService;
    private final ProjectService projectService;

    public boolean hasAtLeastOneReport(Long taskId) {
        return reportRepository.existsByUserTaskCreatedTaskId(taskId);
    }

    public Report save(Report report) {
        return reportRepository.save(report);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<Report> findAllByUserTaskCreatedId(Long id) {
        return reportRepository.findAllByUserTaskCreatedId(id);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long reportId, String newContent, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var report = this.findUpdatableReport(reportId, username);

        var isReportOwner = report.getUserTaskCreated().getAssignedUser().getAccount().getUsername().equals(username);
        if (!isReportOwner)
            throw new AppExc(ErrorCodes.INVALID_TOKEN);

        report.setContent(newContent);
        report.setUpdatedTime(LocalDateTime.now());
        reportRepository.save(report);
    }

    public IdResponse createComment(Long reportId, CommentCreationRequest request, String token) {
        var report = reportRepository.findById(reportId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectActive = report.getUserTaskCreated().getTask().getCollection().getPhase().getProject().isActive();
        if (!isProjectActive) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        return commentOfReportService.create(report, request, token);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void approveReport(Long reportId, String token) {
        var report = this.findUpdatableReport(reportId, token);

        report.setReportStatus(ReportStatus.APPROVED);
        report.setReviewedTime(LocalDateTime.now());
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void rejectReport(Long reportId, String rejectReason, String token) {
        var report = this.findUpdatableReport(reportId, token);

        report.setReportStatus(ReportStatus.REJECTED);
        report.setReviewedTime(LocalDateTime.now());
        report.setRejectedReason(rejectReason);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Report findUpdatableReport(Long reportId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var report = reportTransService.findReviewableReport(reportId, username);

        if (report.getReviewedTime() != null)
            throw new AppExc(ErrorCodes.REPORT_REVIEWED);

        var isProjectActive = report.getUserTaskCreated().getTask().getCollection().getPhase().getProject().isActive();
        if (!isProjectActive) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        var isKickedLeader = projectService.isKickedLeader(report.getUserTaskCreated().getTask(), username);
        if (isKickedLeader) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return report;
    }
}
