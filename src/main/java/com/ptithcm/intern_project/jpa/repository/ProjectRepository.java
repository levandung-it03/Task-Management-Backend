package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
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
        SELECT DISTINCT pj FROM TaskForUsers tfu
        JOIN tfu.task t
        JOIN t.collection c
        JOIN c.phase p
        JOIN p.project pj
        WHERE tfu.assignedUser.account.username = :username
    """)
    List<Project> findAllByUsernameLowRole(@Param("username") String username);

    @Query("""
        SELECT DISTINCT tfu FROM TaskForUsers tfu
        WHERE tfu.task.collection.phase.project.id = :projectId
    """)
    List<TaskForUsers> findAllUsersTaskByProjectId(@Param("projectId") Long projectId);
}
