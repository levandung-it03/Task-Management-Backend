package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.model.dto.response.RecUserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.UserInfoResponse;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.model.enums.Domain;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    List<UserInfo> findAllByEmailIn(List<String> emails);

    @Query("""
        SELECT u FROM UserInfo u
        WHERE LOWER(u.email) LIKE LOWER(CONCAT('%', :email, '%'))
           OR LOWER(u.fullName) LIKE LOWER(CONCAT('%', :fullName, '%'))
    """)
    List<UserInfo> findAllByEmailOrFullName(@Param("email") String email, @Param("fullName") String fullName);

    @Query("""
        SELECT u FROM UserInfo u
        WHERE u.id NOT IN (
            SELECT tfu.assignedUser.id
            FROM TaskForUsers tfu
            WHERE tfu.task.id = :rootTaskId
              OR tfu.task.rootTask.id = :rootTaskId
        )
        AND (LOWER(u.fullName) LIKE LOWER(CONCAT('%', :query, '%'))
        OR LOWER(u.email) LIKE LOWER(CONCAT('%', :query, '%')))
    """)
    List<UserInfo> fastSearchUsersIgnoreInRootTask(@Param("rootTaskId") Long rootTaskId, @Param("query") String query);

    boolean existsByDepartmentId(Long id);

    boolean existsByEmail(String email);

    Optional<UserInfo> findByEmail(String addedUserEmail);

    @Query("""
        SELECT DISTINCT u FROM UserInfo u
        JOIN FETCH u.account a
        JOIN FETCH a.authorities auth
        WHERE NOT u.email IN :emails
        AND (LOWER(u.fullName) LIKE CONCAT('%',LOWER(:query),'%')
            OR LOWER(u.email) LIKE CONCAT('%',LOWER(:query),'%'))
        AND auth.name = 'ROLE_LEAD'
    """)
    List<UserInfo> searchAllLeaderByNotEmailIn(
        @Param("emails") List<String> emails,
        @Param("query") String query);

    @Query("""
        SELECT DISTINCT u FROM UserInfo u
        JOIN FETCH u.account a
        JOIN FETCH a.authorities auth
        WHERE (:#{#filter.id} IS NULL OR u.id = :#{#filter.id})
        AND (:#{#filter.department} IS NULL OR LOWER(u.department.name) LIKE LOWER(CONCAT('%',:#{#filter.department},'%')))
        AND (:#{#filter.email} IS NULL OR LOWER(u.email) LIKE LOWER(CONCAT('%',:#{#filter.email},'%')))
        AND (:#{#filter.fullName} IS NULL OR LOWER(u.fullName) LIKE LOWER(CONCAT('%',:#{#filter.fullName},'%')))
        AND (:#{#filter.phone} IS NULL OR u.phone LIKE CONCAT('%',:#{#filter.phone},'%'))
        AND (:#{#filter.identity} IS NULL OR u.identity LIKE CONCAT('%',:#{#filter.identity},'%'))
        AND (:#{#filter.authorities} IS NULL OR LOWER(auth.name) LIKE LOWER(CONCAT('%',:#{#filter.authorities},'%')))
    """)
    Page<UserInfo> searchFullPaginatedInformationUsers(@Param("filter") UserInfoResponse filter, Pageable pageable);

    @Query("""
        SELECT COUNT(DISTINCT u.id) FROM UserInfo u
        JOIN u.account a
        JOIN a.authorities auth
        WHERE (:scopes LIKE '%ROLE_PM%' AND auth.name <> 'ROLE_PM')
        OR (:scopes LIKE '%ROLE_LEAD%' AND auth.name = 'ROLE_EMP')
    """)
    int countAllUsersToRecommend(@Param("scopes") String scopes);

    @Query("SELECT u.id FROM UserInfo u WHERE u.account.status = FALSE")
    List<Long> findAllInactiveUsersByAccount();

    @Query("""
        SELECT DISTINCT u FROM UserInfo u
        JOIN FETCH u.account a
        JOIN FETCH a.authorities auth
        WHERE u.id IN :ids
        AND auth.name = :authEnum
    """)
    List<UserInfo> findAllByIdsAndAuthority(
        @Param("ids") List<Long> rankedUserIds,
        @Param("authEnum") String authEnum);
}
