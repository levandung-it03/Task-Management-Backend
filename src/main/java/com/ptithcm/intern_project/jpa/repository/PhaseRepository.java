package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Phase;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhaseRepository extends JpaRepository<Phase, Long> {
    List<Phase> findAllByProjectId(Long projectId);

    @Query("""
        SELECT DISTINCT p FROM TaskForUsers tfu
        JOIN tfu.task t
        JOIN t.collection c
        JOIN c.phase p
        JOIN p.project pj
        WHERE pj.id = :projectId
        AND tfu.assignedUser.account.username = :username
    """)
    List<Phase> findAllByAssignedUsernameAndProjectId(
        @Param("projectId") Long projectId,
        @Param("username") String username);

    boolean existsByProjectId(Long id);

    @Query("""
        SELECT CASE WHEN COUNT(p) > 0 THEN TRUE ELSE FALSE END FROM Phase p
        WHERE p.project.id = :projectId
        AND p.endDate IS NULL
    """)
    boolean existsNotCompleteByProjectId(@Param("projectId") Long projectId);
}
