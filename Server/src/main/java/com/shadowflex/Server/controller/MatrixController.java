package com.shadowflex.Server.controller;

import com.shadowflex.Server.dto.MatrixDTO;
import com.shadowflex.Server.dto.MatrixSimpleDTO;
import com.shadowflex.Server.exception.NotFoundException;
import com.shadowflex.Server.model.Matrix;
import com.shadowflex.Server.repository.MatrixRepository;
import com.shadowflex.Server.util.Language;
import com.shadowflex.Server.util.LanguageConverter;
import com.shadowflex.Server.util.MatrixToDtoConverter;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/matrix")
@RequiredArgsConstructor
public class MatrixController {
    private final MatrixRepository repository;
    private final MatrixToDtoConverter dtoConverter;
    private final LanguageConverter languageConverter;

    @GetMapping("/{id}")
    public MatrixDTO getById(@PathVariable Long id, @RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        Optional<Matrix> spellOptional = repository.findById(id);
        if(spellOptional.isEmpty())
            throw new NotFoundException("Matrix action " + id + " not found");
        return dtoConverter.convert(spellOptional.get(), lang);
    }

    @GetMapping("/search")
    public MatrixDTO getByName(@RequestParam("name") String name, @RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        Optional<Matrix> matrixOptional = switch(lang) {
            case ru -> repository.findByNameRu(name);
            case en -> repository.findByNameEn(name);
        };
        if(matrixOptional.isEmpty())
            throw new NotFoundException("Matrix action " + name + " not found");
        return dtoConverter.convert(matrixOptional.get(), lang);
    }

    @GetMapping
    public Map<Matrix.Type, List<MatrixSimpleDTO>> getAll(@RequestParam("lang") String langParam) {
        Language lang = languageConverter.convert(langParam);
        return repository.findAll().stream()
                .collect(Collectors.groupingBy(
                        Matrix::getType,
                        Collectors.mapping(m -> dtoConverter.convertToSimple(m, lang), Collectors.toList())
                ));
    }
}
