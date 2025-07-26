package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {

}
