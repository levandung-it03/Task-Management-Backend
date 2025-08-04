package com.ptithcm.intern_project.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.model.enums.TaskLevel;
import com.ptithcm.intern_project.jpa.model.enums.TaskPriority;
import com.ptithcm.intern_project.jpa.model.enums.TaskType;
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
    TaskType taskType;
    TaskPriority priority;
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

    boolean hasAtLeastOneReport;
}
