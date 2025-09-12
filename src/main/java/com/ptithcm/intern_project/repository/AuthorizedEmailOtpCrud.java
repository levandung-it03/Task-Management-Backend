package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.cache.AuthorizedEmailOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorizedEmailOtpCrud extends CrudRepository<AuthorizedEmailOtp, String> {
}
