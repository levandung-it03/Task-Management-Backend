package com.ptithcm.intern_project.jpa.repository;

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
        WHERE (c.id = :collectionId
            AND tfu.assignedUser.account.username = :username)
        OR t.userInfoCreated.account.username = :username
        OR t.collection.phase.project.userInfoCreated.account.username = :username
    """)
    List<Task> findAllByRelatedByCollectionIdAndUsername(
        @Param("collectionId") Long collectionId,
        @Param("username") String username);

    @Query("""
        SELECT DISTINCT t FROM TaskForUsers tfu
        JOIN tfu.task t
        WHERE tfu.task.userInfoCreated.account.username = :username
        AND tfu.task.endDate IS NULL
    """)
    List<Task> findAllCreatedAndUndoneByUsername(@Param("username") String username);

    @Query("""
        SELECT DISTINCT t FROM TaskForUsers tfu
        JOIN tfu.task t
        WHERE tfu.assignedUser.account.username = :username
        AND tfu.id NOT IN (
            SELECT utc.id FROM Report r
            JOIN r.userTaskCreated utc
            WHERE r.reportStatus = 'APPROVED'
        )
    """)
    List<Task> findAllAssignedAndUndoneByUsername(String username);

    List<Task> findAllByRootTaskId(Long rootTaskId);

    @Query("""
        SELECT CASE WHEN COUNT(tfu) > 0 THEN TRUE ELSE FALSE END
        FROM TaskForUsers tfu
        JOIN tfu.task t
        WHERE t.id = :taskId
        AND NOT tfu.userTaskStatus = 'KICKED_OUT'
        AND tfu NOT IN (
            SELECT utc FROM Report r
            JOIN r.userTaskCreated utc
            WHERE r.reportStatus = 'APPROVED'
        )
    """)
    boolean existsUndoneTaskByIdViaReport(@Param("taskId") Long taskId);

    @Query("""
        SELECT CASE WHEN COUNT(subTask) > 0 THEN TRUE ELSE FALSE END
        FROM Task subTask
        WHERE subTask.rootTask.id = :taskId AND subTask.endDate IS NULL
    """)
    boolean existsUndoneTaskByIdViaSubTask(@Param("taskId") Long taskId);
}
