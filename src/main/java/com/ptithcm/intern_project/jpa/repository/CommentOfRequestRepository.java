package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.CommentOfReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentOfRequestRepository extends JpaRepository<CommentOfReport, Long> {
    List<CommentOfReport> findAllByUserInfoCreatedEmail(String email);
}
