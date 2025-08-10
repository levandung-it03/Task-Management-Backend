package com.ptithcm.intern_project.redis.crud;

import com.ptithcm.intern_project.redis.model.AuthorizedEmailOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorizedEmailOtpCrud extends CrudRepository<AuthorizedEmailOtp, String> {
}
