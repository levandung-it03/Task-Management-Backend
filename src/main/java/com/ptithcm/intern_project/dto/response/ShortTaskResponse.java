package com.ptithcm.intern_project.dto.response;

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
public class ShortTaskResponse {
    Long id;
    String name;
    TaskType taskType;
    TaskPriority taskPriority;
    LocalDate startDate;
    LocalDate endDate;
    LocalDate deadline;
}
