package com.ptithcm.intern_project.model.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ReportGenClientRequest {
    @JsonProperty("task_name")
    String task;

    @JsonProperty("task_desc")
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

//    @JsonProperty("reject_count")
//    long rejectCount;
//
//    @JsonProperty("reason")
//    String rejectedReason;

    @JsonProperty("creator_name")
    String creatorName;

    @JsonProperty("employee_name")
    String employeeName;

    @JsonProperty("subtask_name")
    String subtaskName;

    @JsonProperty("subtask_desc")
    String subtaskDesc;

    @JsonProperty("subtasks")
    List<ReportGenSubtaskRequest> subtasks;
}
