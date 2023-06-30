package com.shadowflex.Server.controller;

import com.shadowflex.Server.dto.AdeptDTO;
import com.shadowflex.Server.dto.AdeptSimpleDTO;
import com.shadowflex.Server.exception.NotFoundException;
import com.shadowflex.Server.model.Adept;
import com.shadowflex.Server.repository.AdeptRepository;
import com.shadowflex.Server.util.AdeptToDtoConverter;
import com.shadowflex.Server.util.Language;
import com.shadowflex.Server.util.LanguageConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/adepts")
@RequiredArgsConstructor
public class AdeptsController {
    private final AdeptRepository repository;
    private final AdeptToDtoConverter dtoConverter;
    private final LanguageConverter languageConverter;

    @GetMapping("/{id}")
    public AdeptDTO getById(@PathVariable Long id, @RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        Optional<Adept> adeptOptional = repository.findById(id);
        if(adeptOptional.isEmpty())
            throw new NotFoundException("Adept's power " + id + " not found");
        return dtoConverter.convert(adeptOptional.get(), lang);
    }

    @GetMapping
    public Iterable<AdeptSimpleDTO> getAll(@RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        return repository.findAll().stream()
                .map(value -> dtoConverter.convertToSimple(value, lang))
                .collect(Collectors.toList());
    }
}
