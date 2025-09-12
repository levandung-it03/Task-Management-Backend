package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.Expertise;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExpertiseRepository extends JpaRepository<Expertise, Long> {
    boolean existsByName(String name);
}
