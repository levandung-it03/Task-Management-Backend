package com.ptithcm.intern_project.jpa.repository;

import com.ptithcm.intern_project.jpa.model.Collection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionRepository extends JpaRepository<Collection, Long> {
}
