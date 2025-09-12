package com.ptithcm.intern_project.repository;

import com.ptithcm.intern_project.model.cache.RefreshToken;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RefreshTokenCrud extends CrudRepository<RefreshToken, String> {
}
