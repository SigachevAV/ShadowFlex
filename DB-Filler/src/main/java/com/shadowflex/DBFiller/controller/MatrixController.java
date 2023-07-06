package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Matrix;
import com.shadowflex.DBFiller.repository.MatrixRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Slf4j
@Controller
@RequestMapping("/matrix")
@RequiredArgsConstructor
public class MatrixController {
    private final MatrixRepository repository;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("matrix", repository.findAll());
        return "matrix/index";
    }

    @GetMapping("/new")
    public String newMatrixForm(Model model) {
        model.addAttribute("matrix", new Matrix());
        return "matrix/new";
    }

    @GetMapping("/{id}/edit")
    public String editMatrixForm(Model model, @PathVariable Long id) {
        Optional<Matrix> matrixOptional = repository.findById(id);
        if(matrixOptional.isEmpty())
            throw new NotFoundException("Matrix action " + id + " not found");
        model.addAttribute("matrix", matrixOptional.get());
        return "matrix/edit";
    }

    @PostMapping
    public String saveMatrix(
            @ModelAttribute("matrix") @Valid Matrix matrix,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors())
            return "matrix/new";
        repository.save(matrix);
        return "redirect:/matrix";
    }

    @PutMapping("/{id}")
    public String updateMatrix(
            @PathVariable Long id,
            @ModelAttribute("matrix") @Valid Matrix matrix,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors())
            return "matrix/edit";
        repository.findById(id).orElseThrow(() -> new NotFoundException("Matrix action " + id + " not found"));
        matrix.setId(id);
        repository.save(matrix);
        return "redirect:/matrix";
    }

    @DeleteMapping("{id}")
    public String deleteMatrix(@PathVariable Long id) {
        Matrix matrix = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Matrix action " + id + " not found"));
        repository.delete(matrix);
        return "redirect:/matrix";
    }

}
