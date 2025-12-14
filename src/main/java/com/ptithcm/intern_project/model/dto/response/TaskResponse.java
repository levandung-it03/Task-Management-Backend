package com.ptithcm.intern_project.model.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import com.ptithcm.intern_project.model.enums.Domain;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskResponse {
    long id;
    ShortUserInfoDTO userInfo;
    Long rootTaskId;
    String name;
    String description;
    String reportFormat;
    TaskLevel level;
    Domain taskType;
    TaskPriority priority;

    @JsonProperty("isLocked")
    boolean isLocked;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate startDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate endDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate deadline;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime createdTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime updatedTime;

    boolean hasApprovedReport;
    int reportsQty;
}
