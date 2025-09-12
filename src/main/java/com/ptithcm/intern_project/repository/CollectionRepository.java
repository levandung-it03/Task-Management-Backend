package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.Collection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectionRepository extends JpaRepository<Collection, Long> {

    boolean existsByPhaseId(Long id);

    List<Collection> findAllByPhaseId(Long phaseId);

    @Query("""
        SELECT DISTINCT c FROM TaskForUsers tfu
        JOIN tfu.task t
        JOIN t.collection c
        JOIN c.phase p
        WHERE p.id = :phaseId
        AND tfu.assignedUser.account.username = :username
    """)
    List<Collection> findAllByAssignedUsernameAndPhaseId(
        @Param("phaseId") Long phaseId,
        @Param("username") String username);

    @Query("""
        SELECT CASE WHEN COUNT(c) > 0 THEN TRUE ELSE FALSE END FROM Collection c
        WHERE c.phase.id = :phaseId
        AND c.endDate IS NULL
    """)
    boolean existsCollectionNotCompletedByPhaseId(@Param("phaseId") Long phaseId);
}
