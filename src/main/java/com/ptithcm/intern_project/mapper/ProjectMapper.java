package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@NoArgsConstructor
public class ProjectMapper {

    public Project newModel(ProjectRequest request, UserInfo userInfoCreated) {
        return Project.builder()
            .name(request.getName())
            .description(request.getDescription())
            .userInfoCreated(userInfoCreated)
            .startDate(request.getStartDate())
            .dueDate(request.getDueDate())
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .active(true)
            .build();
    }

    public void updateModel(Project project, ProjectRequest request) {
        project.setName(request.getName());
        project.setDescription(request.getDescription());
        project.setStartDate(request.getStartDate());
        project.setDueDate(request.getDueDate());
        project.setUpdatedTime(LocalDateTime.now());
    }
}
