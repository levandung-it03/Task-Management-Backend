package com.ptithcm.intern_project.model.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.ptithcm.intern_project.model.enums.Domain;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RecUsersByModelRequest {

    @Min(1)
    @JsonProperty("num_of_emp")
    int numOfEmp;

    @NotNull
    @JsonProperty("level")
    TaskLevel level;

    @NotNull
    @JsonProperty("priority")
    TaskPriority priority;

    @NotNull
    @JsonProperty("domain")
    Domain domain;

    @JsonProperty("busy_ids")
    List<Long> busyIds;
}