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
public class ReportGenSubtaskRequest {
    @JsonProperty("name")
    String name;

    @JsonProperty("status")
    String status;
}