package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.jpa.model.ProjectRole;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProjectResponse {
    Long id;
    String name;
    String description;
    LocalDate startDate;
    LocalDate endDate;
    LocalDate dueDate;
    boolean active;
    LocalDateTime createdTime;
    LocalDateTime updatedTime;
}
