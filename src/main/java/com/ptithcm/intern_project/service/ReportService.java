package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.model.dto.response.CommentResponse;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.model.Report;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.enums.ProjectStatus;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import com.ptithcm.intern_project.repository.ReportRepository;
import com.ptithcm.intern_project.mapper.CommentOfReportMapper;
import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.service.auth.JwtService;
import com.ptithcm.intern_project.service.interf.InterfRecUsersForTaskSvc;
import com.ptithcm.intern_project.service.interfaces.IReportService;
import com.ptithcm.intern_project.service.email.messages.ReportMsg;
import com.ptithcm.intern_project.service.email.EmailService;
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
    InterfRecUsersForTaskSvc interfRecUsersForTaskSvc;

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long reportId, String newContent, String token) {
        var report = this.findUpdatableReport(reportId, token);
        //--Checked project in-progress by "report"
        //--Checked phase is not ended by "report"
        //--Checked collection is not ended by "report"
        //--Checked task is not ended by "report"

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

    private void validateEndedParentEntities(Report report) {
        var isInProgressProject = report.getUserTaskCreated()
            .getTask().getCollection().getPhase().getProject().getStatus()
            .equals(ProjectStatus.IN_PROGRESS);
        if (!isInProgressProject)   throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = report.getUserTaskCreated()
            .getTask().getCollection().getPhase()
            .getEndDate() != null;
        if (isPhaseEnded)   throw new AppExc(ErrorCodes.PHASE_ENDED);

        var isCollectionEnded = report.getUserTaskCreated()
            .getTask().getCollection().getEndDate() != null;
        if (isCollectionEnded)   throw new AppExc(ErrorCodes.COLLECTION_ENDED);

        var isTaskEnded = report.getUserTaskCreated().getTask().getEndDate() != null;
        if (isTaskEnded)   throw new AppExc(ErrorCodes.TASK_ENDED);
    }

    @Override
    public CommentResponse createComment(Long reportId, CommentCreationRequest request, String token) {
        var report = reportRepository.findById(reportId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        this.validateEndedParentEntities(report);

        return commentOfReportMapper.toResponse(
            commentOfReportService.create(report, request, token)
        );
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void approveReport(Long reportId, String token) {
        var report = this.findUpdatableReport(reportId, token);
        //--Checked project in-progress by "report"
        //--Checked phase is not ended by "report"
        //--Checked collection is not ended by "report"
        //--Checked task is not ended by "report"

        report.setReportStatus(ReportStatus.APPROVED);
        report.setReviewedTime(LocalDateTime.now());

        var taskOwnerInfo = report.getUserTaskCreated().getTask().getUserInfoCreated();
        var userAssignedInfo = report.getUserTaskCreated().getAssignedUser();
        this.notifyViaEmail(
            userAssignedInfo.getEmail(),
            taskOwnerInfo.getFullName() + "/" + taskOwnerInfo.getEmail(),
            report,
            ReportMsg.APPROVED_REPORT);

        var isNotReportOfTaskOwner = !report.getUserTaskCreated().getTask().getUserInfoCreated().getEmail()
            .equals(report.getUserTaskCreated().getAssignedUser().getEmail());
        if (isNotReportOfTaskOwner)     interfRecUsersForTaskSvc.queueNewRecord(report);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void rejectReport(Long reportId, String rejectReason, String token) {
        var report = this.findUpdatableReport(reportId, token);
        //--Checked project in-progress by "report"
        //--Checked phase is not ended by "report"
        //--Checked collection is not ended by "report"
        //--Checked task is not ended by "report"

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

        this.validateEndedParentEntities(report);

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

    public int countAllInProjectByStatus(Long projectId, String status) {
        return reportRepository.countAllInProjectByStatus(projectId, status);
    }
}
