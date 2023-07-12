package com.shadowflex.Server.controller;

import com.shadowflex.Server.dto.SpellDTO;
import com.shadowflex.Server.dto.SpellSimpleDTO;
import com.shadowflex.Server.exception.NotFoundException;
import com.shadowflex.Server.model.Spell;
import com.shadowflex.Server.repository.SpellRepository;
import com.shadowflex.Server.util.Language;
import com.shadowflex.Server.util.LanguageConverter;
import com.shadowflex.Server.util.SpellToDtoConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/spells")
@RequiredArgsConstructor
public class SpellsController {
    private final SpellRepository repository;
    private final SpellToDtoConverter dtoConverter;
    private final LanguageConverter languageConverter;

    @GetMapping("/{id}")
    public SpellDTO getById(@PathVariable Long id, @RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        Optional<Spell> spellOptional = repository.findById(id);
        if(spellOptional.isEmpty())
            throw new NotFoundException("Spell " + id + " not found");
        return dtoConverter.convert(spellOptional.get(), lang);
    }

    @GetMapping("/search")
    public SpellDTO getByName(@RequestParam("name") String name, @RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        Optional<Spell> spellOptional = switch(lang) {
            case ru -> repository.findByNameRu(name);
            case en -> repository.findByNameEn(name);
        };
        if(spellOptional.isEmpty())
            throw new NotFoundException("Spell " + name + " not found");
        return dtoConverter.convert(spellOptional.get(), lang);
    }

    @GetMapping
    public Map<Spell.SpellCategory, List<SpellSimpleDTO>> getAll(@RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        return repository.findAll().stream()
                .collect(Collectors.groupingBy(
                        Spell::getCategory,
                        Collectors.mapping(m -> dtoConverter.convertToSimple(m, lang), Collectors.toList())
                ));
    }
}
