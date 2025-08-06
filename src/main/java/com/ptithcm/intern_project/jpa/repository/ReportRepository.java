package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {

    boolean existsByUserTaskCreatedTaskId(Long taskId);

    List<Report> findAllByUserTaskCreatedId(Long id);

    @Query("""
        SELECT CASE WHEN COUNT(r) > 0 THEN TRUE ELSE FALSE END
        FROM Report r
        JOIN r.userTaskCreated rtc
        WHERE rtc.task.id = :taskId
        AND rtc.assignedUser.email IN :emails
    """)
    boolean existsByEmailsInAndTaskId(@Param("emails") List<String> assignedEmails, @Param("taskId") Long taskId);

    @Query("""
        SELECT CASE WHEN COUNT(r) > 0 THEN TRUE ELSE FALSE END
        FROM Report r
        WHERE r.userTaskCreated.task.id = :taskId
        OR (r.userTaskCreated.task.rootTask IS NOT NULL
            AND r.userTaskCreated.task.id = :taskId)
    """)
    boolean existsReportByTaskId(@Param("taskId") Long id);
}
