package com.shadowflex.Server.repository;

import com.shadowflex.Server.model.Spell;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SpellRepository extends JpaRepository<Spell, Long> {
    Optional<Spell> findByNameRu(String name);
    Optional<Spell> findByNameEn(String name);
}
