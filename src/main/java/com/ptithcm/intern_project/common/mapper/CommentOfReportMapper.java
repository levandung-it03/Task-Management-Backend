package com.ptithcm.intern_project.common.mapper;

import com.ptithcm.intern_project.dto.response.CommentResponse;
import com.ptithcm.intern_project.jpa.model.CommentOfReport;
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
            .repliedCommendId(commentOfReport.getRepliedComment().getId())
            .createdTime(commentOfReport.getCreatedTime())
            .build();
    }
}
