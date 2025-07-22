package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Long> {
    boolean existsByName(String name);
}
