package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.cache.RegisterOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterOtpCrud extends CrudRepository<RegisterOtp, String> {
}
