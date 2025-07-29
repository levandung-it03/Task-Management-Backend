package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.CommentOfReport;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.repository.CommentOfRequestRepository;
import com.ptithcm.intern_project.jpa.repository.ReportRepository;
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
public class CommentOfReportService {
    CommentOfRequestRepository commentOfRequestRepository;
    UserInfoService userInfoService;
    ProjectService projectService;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public IdResponse create(Report report, CommentCreationRequest request, String token) {
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
        var isKickedLeaderProject = projectService.isKickedLeader(
            report.getUserTaskCreated().getTask(),
            userInfoCreating.getAccount().getUsername());
        var isTaskOwner = userInfoCreating.getAccount().getUsername().equals(
            report.getUserTaskCreated()
                .getTask()
                .getUserInfoCreated().getAccount().getUsername()
        );

        if (!isAssignedUser && !isProjectOwner && !isTaskOwner && !isKickedLeaderProject)
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var comment = CommentOfReport.builder()
            .userInfoCreated(userInfoCreating)
            .report(report)
            .comment(request.getContent())
            .createdTime(LocalDateTime.now())
            .build();

        if (request.getRepliedCommentId() != null) {
            var repliedComment = commentOfRequestRepository.findById(request.getRepliedCommentId())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
            comment.setRepliedComment(repliedComment);
        }

        var savedComment = commentOfRequestRepository.save(comment);
        return IdResponse.builder().id(savedComment.getId()).build();
    }
}
