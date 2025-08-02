package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.annotation.constraint.ListTypeConstraint;
import com.ptithcm.intern_project.jpa.model.enums.TaskLevel;
import com.ptithcm.intern_project.jpa.model.enums.TaskPriority;
import com.ptithcm.intern_project.jpa.model.enums.TaskType;
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
    LocalDate deadline;

    @NotNull
    LocalDate startDate;

    @NotNull
    TaskLevel level;

    @NotNull
    TaskPriority priority;

    @NotNull
    TaskType taskType;

    @NotNull
    @NotEmpty
    String description;

    String reportFormat;

    @NotNull
    @NotEmpty
    @ListTypeConstraint(type = String.class)
    List<String> assignedEmails;
}
