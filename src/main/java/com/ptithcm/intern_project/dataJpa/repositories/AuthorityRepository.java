package com.ptithcm.intern_project.dataJpa.repositories;

import com.ptithcm.intern_project.dataJpa.entities.Authority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AuthorityRepository extends JpaRepository<Authority, Long> {

    @Query("SELECT a FROM Authority a WHERE a.name LIKE :enumVal")
    Optional<Authority> findByEnumStr(@Param("enumVal") String enumVal);
}
