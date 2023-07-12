package com.shadowflex.Server.repository;

import com.shadowflex.Server.model.Adept;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AdeptRepository extends JpaRepository<Adept, Long> {
    Optional<Adept> findByNameRu(String name);
    Optional<Adept> findByNameEn(String name);
}
