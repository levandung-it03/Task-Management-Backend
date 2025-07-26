package com.ptithcm.intern_project.dto.response;

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
    UserInfo userInfo;
    Task rootTask;
    String name;
    String description;
    String reportFormat;
    TaskLevel level;
    TaskType taskType;
    TaskPriority priority;
    boolean isLocked;
    LocalDate startDate;
    LocalDate endDate;
    LocalDate deadline;
    LocalDateTime createdTime;
    LocalDateTime updatedTime;
    boolean hasAtLeastOneReport;
}
