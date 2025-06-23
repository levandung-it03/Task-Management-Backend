package com.ptithcm.intern_project.redis.redis_cruds;

import com.ptithcm.intern_project.redis.redis_tables.LostPassOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LostPassOtpCrud extends CrudRepository<LostPassOtp, String> {
}
