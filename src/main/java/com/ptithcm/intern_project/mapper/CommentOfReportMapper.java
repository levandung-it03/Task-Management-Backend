package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.dto.response.CommentResponse;
import com.ptithcm.intern_project.model.CommentOfReport;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
public class CommentOfReportMapper {
    UserInfoMapper userInfoMapper;

    public CommentResponse toResponse(CommentOfReport commentOfReport) {
        return CommentResponse.builder()
            .id(commentOfReport.getId())
            .comment(commentOfReport.getComment())
            .createdBy(userInfoMapper.shortenUserInfo(commentOfReport.getUserInfoCreated()))
            .repliedCommendId(commentOfReport.getRepliedComment() == null
                ? null
                : commentOfReport.getRepliedComment().getId())
            .createdTime(commentOfReport.getCreatedTime())
            .build();
    }
}
