package com.ptithcm.intern_project.jpa.repository;

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

    List<TaskForUsers> findAllByTaskId(Long taskId);

    @Query("""
        SELECT t.task FROM TaskForUsers t
        WHERE t.task.id = :rootId
        AND t.assignedUser.account.username = :assignedUsername
    """)
    Optional<Task> findByRootIdAndAssignedUsername(@Param("rootId") Long rootId, @Param("assignedUsername") String username);

    @Query("""
        SELECT tfu FROM TaskForUsers tfu
        WHERE tfu.task.rootTask.id = :rootId
        AND tfu.task.userInfoCreated.account.username = :username
        AND (LOWER(tfu.assignedUser.fullName) LIKE LOWER(CONCAT('%',:query,'%'))
            OR LOWER(tfu.assignedUser.email) LIKE LOWER(CONCAT('%',:query,'%')))
    """)
    List<TaskForUsers> searchTheRestUsersOnRoot(
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
}
