package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.ProjectRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProjectRoleRepository extends JpaRepository<ProjectRole, Long> {

    Optional<ProjectRole> findByUserInfoEmail(String email);
}
