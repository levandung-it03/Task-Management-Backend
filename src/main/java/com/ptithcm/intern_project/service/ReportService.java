package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.dto.response.CommentResponse;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.model.enums.ReportStatus;
import com.ptithcm.intern_project.jpa.repository.ReportRepository;
import com.ptithcm.intern_project.mapper.CommentOfReportMapper;
import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.IReportService;
import com.ptithcm.intern_project.service.messages.CommentOfReportMsg;
import com.ptithcm.intern_project.service.messages.ReportMsg;
import com.ptithcm.intern_project.service.supports.EmailService;
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
public class ReportService implements IReportService {
    ReportRepository reportRepository;
    CommentOfReportService commentOfReportService;
    JwtService jwtService;
    CommentOfReportMapper commentOfReportMapper;
    UserInfoService userInfoService;
    EmailService emailService;

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long reportId, String newContent, String token) {
        var report = this.findUpdatableReport(reportId, token);

        String username = jwtService.readPayload(token).get("sub");

        var isReportOwner = report.getUserTaskCreated().getAssignedUser().getAccount().getUsername().equals(username);
        if (!isReportOwner)     throw new AppExc(ErrorCodes.INVALID_TOKEN);

        report.setContent(newContent);
        report.setUpdatedTime(LocalDateTime.now());
        reportRepository.save(report);

        var taskOwnerInfo = report.getUserTaskCreated().getTask().getUserInfoCreated();
        var userAssignedInfo = report.getUserTaskCreated().getAssignedUser();
        this.notifyViaEmail(
            taskOwnerInfo.getEmail(),
            userAssignedInfo.getFullName() + "/" + userAssignedInfo.getEmail(),
            report,
            ReportMsg.UPDATED_REPORT);
    }

    @Override
    public CommentResponse createComment(Long reportId, CommentCreationRequest request, String token) {
        var report = reportRepository.findById(reportId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectActive = report.getUserTaskCreated().getTask().getCollection().getPhase().getProject().isActive();
        if (!isProjectActive) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        return commentOfReportMapper.toResponse(
            commentOfReportService.create(report, request, token)
        );
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void approveReport(Long reportId, String token) {
        var report = this.findUpdatableReport(reportId, token);

        report.setReportStatus(ReportStatus.APPROVED);
        report.setReviewedTime(LocalDateTime.now());

        var taskOwnerInfo = report.getUserTaskCreated().getTask().getUserInfoCreated();
        var userAssignedInfo = report.getUserTaskCreated().getAssignedUser();
        this.notifyViaEmail(
            userAssignedInfo.getEmail(),
            taskOwnerInfo.getFullName() + "/" + taskOwnerInfo.getEmail(),
            report,
            ReportMsg.APPROVED_REPORT);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void rejectReport(Long reportId, String rejectReason, String token) {
        var report = this.findUpdatableReport(reportId, token);

        report.setReportStatus(ReportStatus.REJECTED);
        report.setReviewedTime(LocalDateTime.now());
        report.setRejectedReason(rejectReason);

        var userTaskOwnerInfo = report.getUserTaskCreated().getTask().getUserInfoCreated();
        var userAssignedInfo = report.getUserTaskCreated().getAssignedUser();
        this.notifyViaEmail(
            userAssignedInfo.getEmail(),
            userTaskOwnerInfo.getFullName() + "/" + userTaskOwnerInfo.getEmail(),
            report,
            ReportMsg.REJECTED_REPORT);
    }

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
    public Report findUpdatableReport(Long reportId, String token) {
        UserInfo curUser = userInfoService.getUserInfo(token);
        var report = reportRepository.findById(reportId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (report.getReviewedTime() != null)
            throw new AppExc(ErrorCodes.REPORT_REVIEWED);

        var isProjectActive = report.getUserTaskCreated().getTask().getCollection().getPhase().getProject().isActive();
        if (!isProjectActive) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        String curUserRole = curUser.getAccount().getAuthorities().getFirst().getName();
        var isKickedLeader = curUserRole.equals(AuthorityEnum.ROLE_LEAD.toString())
            && ProjectService.isKickedLeader(
                report.getUserTaskCreated().getTask(),
                curUser.getAccount().getUsername());
        if (isKickedLeader) throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return report;
    }

    public boolean existsByEmailsInAndTaskId(List<String> assignedEmails, Long taskId) {
        return reportRepository.existsByEmailsInAndTaskId(assignedEmails, taskId);
    }

    public boolean existsReportByTaskId(Long id) {
        return reportRepository.existsReportByTaskId(id);
    }

    public boolean existsReportByUserTaskCreatedId(Long userTaskId) {
        return reportRepository.existsReportByUserTaskCreatedId(userTaskId);
    }

    @Transactional()
    public void notifyViaEmail(
        String target,
        String specifiedPerson,
        Report report,
        ReportMsg msgEnum) {
        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(target)
            .subject(msgEnum.getSubject())
            .body(msgEnum.format(
                specifiedPerson,
                report.getTitle(),
                report.getUserTaskCreated().getTask().getName(),
                report.getUserTaskCreated().getTask().getCollection().getName(),
                report.getUserTaskCreated().getTask().getCollection().getPhase().getName(),
                report.getUserTaskCreated().getTask().getCollection().getPhase().getProject().getName()
            ))
            .build());
    }
}
