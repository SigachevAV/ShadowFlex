package com.shadowflex.Server.repository;

import com.shadowflex.Server.model.Spell;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SpellRepository extends JpaRepository<Spell, Long> {
    List<Spell> findByNameRuContainingIgnoreCase(String name);
    List<Spell> findByNameEnContainingIgnoreCase(String name);
}
