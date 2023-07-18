package com.shadowflex.Server.repository;

import com.shadowflex.Server.model.Adept;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AdeptRepository extends JpaRepository<Adept, Long> {
    List<Adept> findByNameRuContainingIgnoreCase(String name);
    List<Adept> findByNameEnContainingIgnoreCase(String name);
}
