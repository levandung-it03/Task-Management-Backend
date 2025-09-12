package com.ptithcm.intern_project.model.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ReportCommentsResponse {
    ReportResponse report;
    List<CommentResponse> comments;
}
