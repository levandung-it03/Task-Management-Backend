package com.ptithcm.intern_project.redis.crud;

import com.ptithcm.intern_project.redis.model.LostPassOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LostPassOtpCrud extends CrudRepository<LostPassOtp, String> {
}
