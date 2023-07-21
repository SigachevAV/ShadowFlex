package com.shadowflex.Server.repository;

import com.shadowflex.Server.model.Matrix;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MatrixRepository extends JpaRepository<Matrix, Long> {
    List<Matrix> findByNameRuContainingIgnoreCase(String name);
    List<Matrix> findByNameEnContainingIgnoreCase(String name);
}
