package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Long> {
    Optional<UserInfo> findByAccountId(Long accountId);

    Optional<UserInfo> findByAccountUsername(String sub);

    List<UserInfo> findAllByEmailIn(@Param("emails") List<String> emails);

    @Query("""
        SELECT u FROM UserInfo u
        WHERE LOWER(u.email) LIKE LOWER(CONCAT('%', :email, '%'))
           OR LOWER(u.fullName) LIKE LOWER(CONCAT('%', :fullName, '%'))
    """)
    List<UserInfo> findAllByEmailOrFullName(String email, String fullName);

    @Query("""
        SELECT u FROM UserInfo u
        WHERE u.id NOT IN (
            SELECT tfu.assignedUser.id
            FROM TaskForUsers tfu
            WHERE tfu.task.id = :rootTaskId
        )
        AND (LOWER(u.fullName) LIKE LOWER(CONCAT('%', :query, '%'))
        OR LOWER(u.email) LIKE LOWER(CONCAT('%', :query, '%')))
    """)
    List<UserInfo> fastSearchUsersIgnoreInRootTask(@Param("taskId") Long rootTaskId, @Param("query") String query);

    boolean existsByDepartmentId(Long id);
}
