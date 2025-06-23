package com.ptithcm.intern_project.redis.redis_cruds;

import com.ptithcm.intern_project.redis.redis_tables.InvalidToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InvalidTokenCrud extends CrudRepository<InvalidToken, String> {
}
