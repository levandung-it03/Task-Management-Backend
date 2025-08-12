package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.jpa.model.CommentOfReport;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.CommentOfRequestRepository;
import com.ptithcm.intern_project.service.messages.CommentOfReportMsg;
import com.ptithcm.intern_project.service.supports.EmailService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CommentOfReportService {
    CommentOfRequestRepository commentOfRequestRepository;
    UserInfoService userInfoService;
    EmailService emailService;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public CommentOfReport create(Report report, CommentCreationRequest request, String token) {
        //--Checked project in-progress by "report"
        //--Checked phase is not ended by "report"
        //--Checked collection is not ended by "report"
        var userInfoCreating = userInfoService.getUserInfo(token);

        var isAssignedUser = userInfoCreating.getAccount().getUsername().equals(
            report.getUserTaskCreated().getAssignedUser().getAccount().getUsername()
        );
        var isProjectOwner = userInfoCreating.getAccount().getUsername().equals(
            report.getUserTaskCreated()
                .getTask()
                .getCollection()
                .getPhase()
                .getProject()
                .getUserInfoCreated().getAccount().getUsername()
        );
        var isTaskOwner = userInfoCreating.getAccount().getUsername().equals(
            report.getUserTaskCreated()
                .getTask()
                .getUserInfoCreated().getAccount().getUsername()
        );

        if (!isAssignedUser && !isProjectOwner && !isTaskOwner)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isKickedLeaderProject = ProjectService.isKickedLeader(
            report.getUserTaskCreated().getTask(),
            userInfoCreating.getAccount().getUsername());
        if (isKickedLeaderProject)  throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var comment = CommentOfReport.builder()
            .userInfoCreated(userInfoCreating)
            .report(report)
            .comment(request.getContent())
            .createdTime(LocalDateTime.now())
            .build();

        var isReplyingComment = request.getRepliedCommentId() != null;
        if (isReplyingComment) {
            var repliedComment = commentOfRequestRepository.findById(request.getRepliedCommentId())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
            comment.setRepliedComment(repliedComment);
            this.notifyViaEmail(
                repliedComment.getUserInfoCreated().getEmail(),
                userInfoCreating,
                report,
                CommentOfReportMsg.REPLIED_COMMENT);

        } else {
            this.notifyViaEmail(
                report.getUserTaskCreated().getAssignedUser().getEmail(),
                userInfoCreating,
                report,
                CommentOfReportMsg.CREATED_COMMENT);
        }
        return commentOfRequestRepository.save(comment);
    }

    @Transactional()
    public void notifyViaEmail(
        String target,
        UserInfo userCreating,
        Report report,
        CommentOfReportMsg msgEnum) {
        emailService.sendSimpleEmail(EmailTaskDTO.builder()
            .to(target)
            .subject(msgEnum.getSubject())
            .body(msgEnum.format(
                userCreating.getFullName() + "/" + userCreating.getEmail(),
                report.getUserTaskCreated().getAssignedUser().getFullName()
                    + "/" + report.getUserTaskCreated().getAssignedUser().getEmail(),
                report.getTitle(),
                report.getUserTaskCreated().getTask().getName(),
                report.getUserTaskCreated().getTask().getCollection().getName(),
                report.getUserTaskCreated().getTask().getCollection().getPhase().getName(),
                report.getUserTaskCreated().getTask().getCollection().getPhase().getProject().getName()
            ))
            .build());
    }
}
