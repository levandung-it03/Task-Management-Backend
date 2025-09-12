package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {

    @Query("""
        SELECT DISTINCT p FROM ProjectRole pr
        JOIN pr.project p
        WHERE pr.userInfo.account.username = :username
    """)
    List<Project> findAllByUsernameHighRole(@Param("username") String username);

    @Query("""
        SELECT DISTINCT tfu.task.collection.phase.project FROM TaskForUsers tfu
        WHERE tfu.assignedUser.account.username = :username
    """)
    List<Project> findAllByUsernameLowRole(@Param("username") String username);
}
