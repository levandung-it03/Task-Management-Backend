package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.cache.LostPassOtp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LostPassOtpCrud extends CrudRepository<LostPassOtp, String> {
}
