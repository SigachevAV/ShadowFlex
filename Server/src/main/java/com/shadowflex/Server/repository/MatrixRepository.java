package com.shadowflex.Server.repository;

import com.shadowflex.Server.model.Matrix;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MatrixRepository extends JpaRepository<Matrix, Long> {
    Optional<Matrix> findByNameRu(String name);
    Optional<Matrix> findByNameEn(String name);
}
