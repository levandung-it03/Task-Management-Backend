package com.ptithcm.intern_project.redis.crud;

import com.ptithcm.intern_project.redis.model.RegisterOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegisterOtpCrud extends CrudRepository<RegisterOtp, String> {
}
