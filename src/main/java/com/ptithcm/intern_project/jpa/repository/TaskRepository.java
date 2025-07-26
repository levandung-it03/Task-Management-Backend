package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    boolean existsByUserInfoCreatedAccountUsername(String username);
}
