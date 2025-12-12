package com.ptithcm.intern_project.model.dto.request;

import com.ptithcm.intern_project.config.annotation.constraint.FutureDateConstraint;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import com.ptithcm.intern_project.model.enums.Domain;
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
    Domain taskType;

    @NotNull
    TaskPriority priority;

    @FutureDateConstraint
    LocalDate startDate;

    @FutureDateConstraint
    LocalDate deadline;

    String addedUserEmail;
}
