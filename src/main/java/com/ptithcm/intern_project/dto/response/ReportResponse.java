package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.enums.ReportStatus;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ReportResponse {
    Long id;
    ShortUserInfoDTO createdBy;
    String title;
    String content;
    String rejectedReason;
    ReportStatus reportStatus;
    LocalDateTime reviewedTime;
    LocalDateTime createdTime;
    LocalDateTime updatedTime;
}
