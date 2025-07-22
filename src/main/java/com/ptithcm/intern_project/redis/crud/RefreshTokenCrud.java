package com.ptithcm.intern_project.redis.crud;

import com.ptithcm.intern_project.redis.model.RefreshToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefreshTokenCrud extends CrudRepository<RefreshToken, String> {
}
