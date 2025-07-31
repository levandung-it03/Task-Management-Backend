package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    boolean existsByUserInfoCreatedAccountUsername(String username);

    boolean existsByCollectionId(Long id);

    List<Task> findAllByCollectionId(Long collectionId);

    @Query("""
        SELECT DISTINCT t FROM TaskForUsers tfu
        JOIN tfu.task t
        JOIN t.collection c
        WHERE c.id = :collectionId
        AND tfu.assignedUser.account.username = :username
    """)
    List<Task> findAllByAssignedUsernameAndCollectionId(
        @Param("collectionId") Long collectionId,
        @Param("username") String username);
}
