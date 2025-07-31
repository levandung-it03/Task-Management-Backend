package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Collection;
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
}
