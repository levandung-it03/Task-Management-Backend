package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Long> {
    Optional<UserInfo> findByAccountId(Long accountId);

    Optional<UserInfo> findByAccountUsername(String sub);
}
