package com.shadowflex.Server.controller;

import com.shadowflex.Server.dto.SpellDTO;
import com.shadowflex.Server.repository.SpellRepository;
import com.shadowflex.Server.util.Language;
import com.shadowflex.Server.util.SpellToDtoConverter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

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
        // TODO: invalid id exception + ? invalid lang exc ?
        return repository.findById(id).map(value -> mapper.convert(value, lang)).orElse(null);
    }
}
