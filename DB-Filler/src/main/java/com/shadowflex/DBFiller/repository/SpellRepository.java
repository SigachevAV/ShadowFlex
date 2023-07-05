package com.shadowflex.DBFiller.repository;

import com.shadowflex.DBFiller.model.Spell;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpellRepository extends CrudRepository<Spell, Long> {
}
