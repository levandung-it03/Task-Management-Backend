package com.ptithcm.intern_project.data_jpa.repositories;

import com.ptithcm.intern_project.data_jpa.entities.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserInfoRepository extends JpaRepository<UserInfo, Long> {
    Optional<UserInfo> findByAccountAccountId(Long accountId);

    Optional<UserInfo> findByAccountUsername(String sub);
}
