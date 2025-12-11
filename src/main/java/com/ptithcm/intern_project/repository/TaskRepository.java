package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    boolean existsByUserInfoCreatedAccountUsername(String username);

    boolean existsByCollectionId(Long id);

    List<Task> findAllDistinctByCollectionIdAndRootTaskIsNull(Long collectionId);

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
              SELECT tfu2.id FROM TaskForUsers tfu2
              JOIN tfu2.reports r
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

    @Query("""
        SELECT COUNT(t) FROM Task t
        JOIN t.collection c
        JOIN c.phase p
        JOIN p.project pj
        WHERE pj.id = :projectId
        AND t.rootTask IS NULL
        AND t.endDate IS NOT NULL
        AND t.endDate < t.deadline
    """)
    int countAllInProjectDoneOnTime(@Param("projectId") Long projectId);

    @Query("""
        SELECT COUNT(t) FROM Task t
        JOIN t.collection c
        JOIN c.phase p
        JOIN p.project pj
        WHERE pj.id = :projectId
        AND t.rootTask IS NULL
        AND t.endDate IS NOT NULL
        AND t.endDate >= t.deadline
    """)
    int countAllInProjectLate(@Param("projectId") Long projectId);

    @Query("""
        SELECT CASE WHEN COUNT(t) > 0 THEN TRUE ELSE FALSE END FROM Task t
        WHERE t.collection.id = :collectionId
        AND t.endDate IS NULL
    """)
    boolean existsTaskNotCompletedByCollectionId(@Param("collectionId") Long collectionId);

    List<Task> findAllByCollectionId(Long id);

    List<Task> findAllDistinctByCollectionId(Long id);

    boolean existsByNameAndCollectionId(String name, Long colId);

    Optional<Task> findByRootTaskId(Long id);
}
