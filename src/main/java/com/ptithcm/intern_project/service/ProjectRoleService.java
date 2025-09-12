package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.ProjectRole;
import com.ptithcm.intern_project.repository.ProjectRoleRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ProjectRoleService {
    ProjectRoleRepository projectRoleRepository;

    public List<ProjectRole> saveAll(List<ProjectRole> projectRoles) {
        return projectRoleRepository.saveAll(projectRoles);
    }

    public Optional<ProjectRole> findByUserInfoEmail(String email) {
        return projectRoleRepository.findByUserInfoEmail(email);
    }

    public void delete(ProjectRole kickedLeader) {
        projectRoleRepository.delete(kickedLeader);
    }
}
