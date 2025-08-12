package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.annotation.constraint.FutureDateConstraint;
import com.ptithcm.intern_project.jpa.model.enums.TaskLevel;
import com.ptithcm.intern_project.jpa.model.enums.TaskPriority;
import com.ptithcm.intern_project.jpa.model.enums.TaskType;
import jakarta.validation.constraints.NotNull;
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
    @NotNull
    TaskLevel level;

    @NotNull
    TaskType taskType;

    @NotNull
    TaskPriority priority;

    @NotNull
    @FutureDateConstraint
    LocalDate deadline;

    String addedUserEmail;
}
