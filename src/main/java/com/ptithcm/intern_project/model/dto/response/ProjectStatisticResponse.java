package com.ptithcm.intern_project.model.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProjectStatisticResponse {
    int totalProjects;
    int endedProjects;
    int runningProjects;
    int pendingProjects;
}
