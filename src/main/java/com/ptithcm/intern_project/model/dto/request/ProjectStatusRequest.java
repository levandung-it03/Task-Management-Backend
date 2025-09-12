package com.ptithcm.intern_project.model.dto.request;

import com.ptithcm.intern_project.model.enums.ProjectStatus;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProjectStatusRequest {
    ProjectStatus projectStatus;
}
