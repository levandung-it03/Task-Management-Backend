package com.ptithcm.intern_project.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
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
public class ShortTaskResponse {
    Long id;
    String name;
    TaskLevel level;
    TaskType taskType;
    TaskPriority priority;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate startDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate endDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate deadline;
}
