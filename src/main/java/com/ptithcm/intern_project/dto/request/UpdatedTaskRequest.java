package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.jpa.model.enums.TaskLevel;
import com.ptithcm.intern_project.jpa.model.enums.TaskPriority;
import com.ptithcm.intern_project.jpa.model.enums.TaskType;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdatedTaskRequest {
    TaskLevel level;
    TaskType taskType;
    TaskPriority priority;
    LocalDate deadline;
    String addedUserEmail;
}
