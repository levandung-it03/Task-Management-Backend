package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Phase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhaseRepository extends JpaRepository<Phase, Long> {
}
