package com.ptithcm.intern_project.redis.crud;

import com.ptithcm.intern_project.redis.model.ChangePassOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChangePassOtpCrud extends CrudRepository<ChangePassOtp, String> {
}
