package com.ptithcm.intern_project.model.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ReportGenClientRequest {
    String task;

    @JsonProperty("desc")
    String taskDesc;

    @JsonProperty("project")
    String projectName;

    @JsonProperty("project_desc")
    String projectDesc;

    @JsonProperty("phase")
    String phaseName;

    @JsonProperty("phase_desc")
    String phaseDesc;

    @JsonProperty("collection")
    String collectionName;

    @JsonProperty("collection_desc")
    String collectionDesc;

    @JsonProperty("reject_count")
    long rejectCount;

    @JsonProperty("reason")
    String rejectedReason;

    @JsonProperty("employee_name")
    String employeeName;
}
