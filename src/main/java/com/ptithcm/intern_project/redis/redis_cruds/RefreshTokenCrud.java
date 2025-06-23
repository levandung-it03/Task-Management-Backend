package com.ptithcm.intern_project.redis.redis_cruds;

import com.ptithcm.intern_project.redis.redis_tables.RefreshToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefreshTokenCrud extends CrudRepository<RefreshToken, String> {
}
