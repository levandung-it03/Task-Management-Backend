package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.cache.InvalidToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InvalidTokenCrud extends CrudRepository<InvalidToken, String> {
}
