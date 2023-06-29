package com.shadowflex.Server.controller;

import com.shadowflex.Server.dto.SpellDTO;
import com.shadowflex.Server.exception.SpellNotFoundException;
import com.shadowflex.Server.model.Spell;
import com.shadowflex.Server.repository.SpellRepository;
import com.shadowflex.Server.util.Language;
import com.shadowflex.Server.util.SpellToDtoConverter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/spells")
@Slf4j
public class SpellsController {
    private final SpellRepository repository;
    private final SpellToDtoConverter mapper;

    public SpellsController(SpellRepository repository, SpellToDtoConverter mapper) {
        this.repository = repository;
        this.mapper = mapper;
    }

    @GetMapping("/{id}")
    public SpellDTO getById(@PathVariable Long id, @RequestParam("lang") Language lang) {
        Optional<Spell> spellOptional = repository.findById(id);
        if(spellOptional.isEmpty())
            throw new SpellNotFoundException("Spell " + id + " not found");
        return mapper.convert(spellOptional.get(), lang);
    }
}
