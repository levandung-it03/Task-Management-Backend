package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Group;
import com.ptithcm.intern_project.jpa.model.GroupHasUsers;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface GroupHasUsersRepository extends JpaRepository<GroupHasUsers, Long> {

    @Query("""
        SELECT ghu.group FROM GroupHasUsers ghu
        WHERE ghu.group.name LIKE CONCAT('%', :query, '%')
          AND (ghu.group.userInfoCreated.email = :email OR ghu.joinedUserInfo.email = :email)
          AND ghu.active = TRUE
        GROUP BY ghu.group
    """)
    Page<Group> findAllRelatedGroups(
        @Param("email") String email,
        @Param("query") String searchVal,
        Pageable pageable);

    Optional<GroupHasUsers> findByJoinedUserInfoEmail(String email);
}
