package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.enums.Domain;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TaskForUsersRepository extends JpaRepository<TaskForUsers, Long> {

    @Query("""
        SELECT t FROM TaskForUsers t
        WHERE t.task.id = :taskId
        AND t.task.userInfoCreated.account.username = :owner
        AND (LOWER(t.assignedUser.fullName) LIKE LOWER(CONCAT('%',:query,'%'))
            OR LOWER(t.assignedUser.email) LIKE LOWER(CONCAT('%',:query,'%')))
    """)
    List<UserInfo> fastSearchUsers(
        @Param("taskId") Long taskId,
        @Param("query") String query,
        @Param("owner") String username);

    @Query("SELECT DISTINCT tfu FROM TaskForUsers tfu WHERE tfu.task.id = :taskId")
    List<TaskForUsers> findAllByTaskId(@Param("taskId") Long taskId);

    @Query("""
        SELECT DISTINCT t FROM TaskForUsers tfu
        JOIN tfu.task t
        WHERE t.rootTask IS NOT NULL AND t.rootTask.id = :rootId
        AND tfu.assignedUser.account.username = :assignedUsername
    """)
    List<Task> findByRootIdAndAssignedUsername(@Param("rootId") Long rootId, @Param("assignedUsername") String username);

    @Query("""
        SELECT tfu.assignedUser FROM TaskForUsers tfu
        WHERE tfu.task.id = :rootId
        AND tfu.task.userInfoCreated.account.username = :username
        AND (LOWER(tfu.assignedUser.fullName) LIKE LOWER(CONCAT('%',:query,'%'))
            OR LOWER(tfu.assignedUser.email) LIKE LOWER(CONCAT('%',:query,'%')))
        AND NOT tfu.userTaskStatus = 'KICKED_OUT'
        AND NOT (
            SELECT CASE WHEN COUNT(r) > 0 THEN TRUE ELSE FALSE END FROM Report r
            WHERE r.userTaskCreated.id = tfu.id
        )
    """)
    List<UserInfo> searchTheRestUsersOnRoot(
        @Param("rootId") Long rootId,
        @Param("query") String query,
        @Param("username") String username);

    @Query("""
        SELECT COUNT(tfu) > 0 FROM TaskForUsers tfu
        JOIN tfu.task t
        JOIN t.collection c
        JOIN c.phase p
        JOIN p.project pj
        WHERE pj.id = :projectId
        AND tfu.assignedUser.account.username = :username
    """)
    boolean existsByProjectIdAndAssignedUsername(@Param("projectId") Long projectId, @Param("username") String username);

    @Query("""
        SELECT tfu FROM TaskForUsers tfu
        WHERE tfu.task.id = :taskId
          AND tfu.assignedUser.account.username = :username
    """)
    Optional<TaskForUsers> findByTaskIdAndAssignedUsername(
        @Param("taskId") Long taskId,
        @Param("username") String username
    );

    @Query("""
        SELECT CASE WHEN COUNT(tfu) > 0 THEN TRUE ELSE FALSE END
        FROM TaskForUsers tfu
        WHERE tfu.assignedUser.account.username = :username
        AND tfu.id = :taskUserId
    """)
    boolean existsByTaskUserIdAndAssignedUsername(
        @Param("taskUserId") Long taskUserId,
        @Param("username") String username);

    List<TaskForUsers> findAllByTaskCollectionPhaseProjectId(Long projectId);

    List<TaskForUsers> findAllByTaskCollectionPhaseId(Long phaseId);

    List<TaskForUsers> findAllByTaskCollectionId(Long collectionId);

    @Query("""
        SELECT CASE WHEN COUNT(tfu) > 0 THEN TRUE ELSE FALSE END
        FROM TaskForUsers tfu
        WHERE tfu.task.rootTask.id = :rootTaskId
    """)
    boolean existsSubTaskOfRootTask(@Param("rootTaskId") Long rootTaskId);

    @Query("""
        SELECT DISTINCT tfu_op.assignedUser.id FROM TaskForUsers tfu_op
        WHERE tfu_op.task.taskType = :taskType
          AND tfu_op.id NOT IN (
              SELECT DISTINCT r.userTaskCreated.id FROM Report r
              WHERE r.reportStatus = com.ptithcm.intern_project.model.enums.ReportStatus.APPROVED
          )
    """)
    List<Long> getBusyUserIdsOnTaskType(@Param("taskType") Domain taskType);
}
