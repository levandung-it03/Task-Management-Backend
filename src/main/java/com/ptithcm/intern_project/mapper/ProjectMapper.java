package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.dto.response.ProjectDetailResponse;
import com.ptithcm.intern_project.dto.response.ProjectOverviewResponse;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.model.enums.ProjectStatus;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@AllArgsConstructor
public class ProjectMapper {
    UserInfoMapper userInfoMapper;

    public Project newModel(ProjectRequest request, UserInfo userInfoCreated) {
        return Project.builder()
            .name(request.getName())
            .description(request.getDescription())
            .userInfoCreated(userInfoCreated)
            .expectedStartDate(request.getExpectedStartDate())
            .dueDate(request.getDueDate())
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .status(ProjectStatus.CREATED)
            .build();
    }

    public void updateModel(Project project, ProjectRequest request) {
        project.setName(request.getName());
        project.setDescription(request.getDescription());
        project.setExpectedStartDate(request.getExpectedStartDate());
        project.setDueDate(request.getDueDate());
        project.setUpdatedTime(LocalDateTime.now());
    }

    public ProjectOverviewResponse toResponse(Project project) {
        return ProjectOverviewResponse.builder()
            .id(project.getId())
            .userInfoCreated(userInfoMapper.shortenUserInfo(project.getUserInfoCreated()))
            .name(project.getName())
            .description(project.getDescription())
            .expectedStartDate(project.getExpectedStartDate())
            .startDate(project.getStartDate())
            .endDate(project.getDueDate())
            .dueDate(project.getDueDate())
            .createdTime(project.getCreatedTime())
            .updatedTime(project.getUpdatedTime())
            .status(project.getStatus())
            .build();
    }

    public ProjectDetailResponse toDetail(Project project) {
        return ProjectDetailResponse.builder()
            .id(project.getId())
            .userInfoCreated(userInfoMapper.shortenUserInfo(project.getUserInfoCreated()))
            .name(project.getName())
            .description(project.getDescription())
            .expectedStartDate(project.getExpectedStartDate())
            .startDate(project.getStartDate())
            .endDate(project.getDueDate())
            .dueDate(project.getDueDate())
            .createdTime(project.getCreatedTime())
            .updatedTime(project.getUpdatedTime())
            .status(project.getStatus())
            .build();
    }
}
