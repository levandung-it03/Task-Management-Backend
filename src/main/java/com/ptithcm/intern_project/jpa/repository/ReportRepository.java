package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {

    boolean existsByUserTaskCreatedTaskId(Long taskId);

    List<Report> findAllByUserTaskCreatedId(Long id);
}
