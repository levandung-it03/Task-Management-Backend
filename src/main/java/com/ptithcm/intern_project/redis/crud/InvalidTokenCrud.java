package com.ptithcm.intern_project.redis.crud;

import com.ptithcm.intern_project.redis.model.InvalidToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InvalidTokenCrud extends CrudRepository<InvalidToken, String> {
}
