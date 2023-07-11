package com.shadowflex.DBFiller.repository;

import com.shadowflex.DBFiller.model.Adept;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdeptRepository extends CrudRepository<Adept, Long> {
}
