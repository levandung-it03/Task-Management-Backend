package com.ptithcm.intern_project.dataJpa.repositories;

import com.ptithcm.intern_project.dataJpa.entities.Department;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Long> {
}
