package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.dto.response.ProjectRoleResponse;
import com.ptithcm.intern_project.model.ProjectRole;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@NoArgsConstructor
public class ProjectRoleMapper {

    public ProjectRoleResponse toResponse(ProjectRole projectRole) {
        var userRole = projectRole.getUserInfo().getAccount().getAuthorities().getFirst().getAuthority();
        return ProjectRoleResponse.builder()
            .fullName(projectRole.getUserInfo().getFullName())
            .email(projectRole.getUserInfo().getEmail())
            .role(userRole)
            .projectRole(projectRole.getRole())
            .build();
    }
}
