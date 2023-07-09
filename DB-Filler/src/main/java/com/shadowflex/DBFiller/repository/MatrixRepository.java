package com.shadowflex.DBFiller.repository;

import com.shadowflex.DBFiller.model.Matrix;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatrixRepository extends CrudRepository<Matrix, Long> {
}
