package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.model.GroupHasUsers;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GroupHasUsersRepository extends JpaRepository<GroupHasUsers, Long> {

    @Query("""
        SELECT ghu.group FROM GroupHasUsers ghu
        WHERE LOWER(ghu.group.name) LIKE LOWER(CONCAT('%', :query, '%'))
          AND (ghu.group.userInfoCreated.email = :email OR ghu.joinedUserInfo.email = :email)
        GROUP BY ghu.group
    """)
    Page<Group> findAllRelatedGroups(
        @Param("email") String email,
        @Param("query") String searchVal,
        Pageable pageable);

    Optional<GroupHasUsers> findByJoinedUserInfoEmail(String email);

    @Query("""
        SELECT ghu.group FROM GroupHasUsers ghu
        WHERE (ghu.joinedUserInfo.account.username = :username
        OR ghu.group.userInfoCreated.account.username = :username)
        AND ghu.group.active = TRUE
        GROUP BY ghu.group
    """)
    List<Group> findAllRelatedToUser(@Param("username") String username);

    @Query("""
        SELECT ghu.joinedUserInfo FROM GroupHasUsers ghu
        WHERE ghu.group.id = :id
        AND NOT ghu.group.userInfoCreated.account.username = :username
        AND ghu.group.active = TRUE
    """)
    List<UserInfo> findAllUsersGroupToAssign(@Param("id") String id, @Param("username") String username);
}
