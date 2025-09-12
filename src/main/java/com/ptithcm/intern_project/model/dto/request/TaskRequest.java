package com.ptithcm.intern_project.model.dto.request;

import com.ptithcm.intern_project.config.annotation.constraint.FutureDateConstraint;
import com.ptithcm.intern_project.config.annotation.constraint.ListTypeConstraint;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import com.ptithcm.intern_project.model.enums.Domain;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskRequest {

    @NotNull
    @NotEmpty
    String name;

    @NotNull
    @FutureDateConstraint
    LocalDate deadline;

    @NotNull
    @FutureDateConstraint
    LocalDate startDate;

    @NotNull
    TaskLevel level;

    @NotNull
    TaskPriority priority;

    @NotNull
    Domain taskType;

    @NotNull
    @NotEmpty
    String description;

    String reportFormat;

    @NotNull
    @NotEmpty
    @ListTypeConstraint(type = String.class)
    List<String> assignedEmails;
}
