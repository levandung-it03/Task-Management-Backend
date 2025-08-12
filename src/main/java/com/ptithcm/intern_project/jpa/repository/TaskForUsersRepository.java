package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.dto.response.UserTaskResponse;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.UserInfo;
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

    @Query("""
        SELECT DISTINCT new com.ptithcm.intern_project.dto.response.UserTaskResponse(
            tfu.id,
            tfu.assignedUser.email,
            tfu.assignedUser.fullName,
            tfu.assignedUser.department.name,
            auth.name,
            tfu.userTaskStatus,
            CASE WHEN SUM(CASE WHEN r.reportStatus = 'APPROVED' THEN 1 ELSE 0 END) > 0
                 THEN TRUE ELSE FALSE END
        )
        FROM TaskForUsers tfu
        JOIN tfu.assignedUser.account.authorities auth
        LEFT JOIN tfu.reports r
        WHERE tfu.task.id = :taskId
        GROUP BY tfu.id, tfu.assignedUser.email, tfu.assignedUser.fullName,
                 tfu.assignedUser.department.name, auth.name, tfu.userTaskStatus
    """)
    List<UserTaskResponse> findAllByTaskId(Long taskId);

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
        SELECT new com.ptithcm.intern_project.dto.response.UserTaskResponse(
            tfu.id,
            tfu.assignedUser.email,
            tfu.assignedUser.fullName,
            tfu.assignedUser.department.name,
            auth.name,
            tfu.userTaskStatus,
            CASE WHEN COUNT(r) > 0 THEN TRUE ELSE FALSE END
        )
        FROM TaskForUsers tfu
        JOIN tfu.assignedUser.account.authorities auth
        LEFT JOIN tfu.reports r ON r.reportStatus = 'APPROVED'
        WHERE tfu.task.id = :taskId
          AND tfu.assignedUser.account.username = :username
        GROUP BY tfu.id, tfu.assignedUser.email, tfu.assignedUser.fullName,
                 tfu.assignedUser.department.name, auth.name, tfu.userTaskStatus
    """)
    Optional<UserTaskResponse> findByTaskIdAndAssignedUsername(
        @Param("taskId") Long taskId,
        @Param("username") String username
    );

}
