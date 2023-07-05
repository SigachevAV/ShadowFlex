package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Adept;
import com.shadowflex.DBFiller.repository.AdeptRepository;
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
@RequestMapping("/adepts")
@RequiredArgsConstructor
public class AdeptsController {
    private final AdeptRepository repository;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("adepts", repository.findAll());
        return "adepts/index";
    }

    @GetMapping("/new")
    public String newAdeptForm(Model model) {
        model.addAttribute("adept", new Adept());
        return "adepts/new";
    }

    @GetMapping("/{id}/edit")
    public String editAdeptForm(Model model, @PathVariable Long id) {
        Optional<Adept> adeptOptional = repository.findById(id);
        if(adeptOptional.isEmpty())
            throw new NotFoundException("Adept power " + id + " not found");
        model.addAttribute("adept", adeptOptional.get());
        return "adepts/edit";
    }

    @PostMapping
    public String saveAdept(
            @ModelAttribute("adept") @Valid Adept adept,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors())
            return "adepts/new";
        repository.save(adept);
        return "redirect:/adepts";
    }

    @PutMapping("/{id}")
    public String updateAdept(
            @PathVariable Long id,
            @ModelAttribute("adept") @Valid Adept adept,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors())
            return "adepts/edit";
        adept.setId(id);
        repository.save(adept);
        return "redirect:/adepts";
    }

    @DeleteMapping("{id}")
    public String deleteAdept(@PathVariable Long id) {
        Adept adept = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Adept power " + id + " not found"));
        repository.delete(adept);
        return "redirect:/adepts";
    }

}
