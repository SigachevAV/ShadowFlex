package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Adept;
import com.shadowflex.DBFiller.repository.AdeptRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        model.addAttribute("create", true);
        return "adepts/edit";
    }

    @GetMapping("/{id}/edit")
    public String editAdeptForm(Model model, @PathVariable Long id) {
        Optional<Adept> adeptOptional = repository.findById(id);
        if(adeptOptional.isEmpty())
            throw new NotFoundException("Adept power " + id + " not found");
        model.addAttribute("adept", adeptOptional.get());
        model.addAttribute("create", false);
        return "adepts/edit";
    }

    @PostMapping
    public String saveAdept() {
        return "redirect:/adepts";
    }

    @PostMapping("{id}/delete")
    public String deleteAdept() {
        return "redirect:/adepts";
    }

}
