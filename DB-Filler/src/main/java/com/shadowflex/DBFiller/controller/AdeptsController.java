package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Adept;
import com.shadowflex.DBFiller.repository.AdeptRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView saveAdept(@ModelAttribute("adept") @Valid Adept adept, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();

        if(bindingResult.hasErrors()) {
            modelAndView.setViewName("adepts/edit");
            modelAndView.setStatus(HttpStatus.NO_CONTENT);
        }
        else {
            repository.save(adept);
            modelAndView.setViewName("redirect:/adepts");
            modelAndView.setStatus(HttpStatus.CREATED);
        }

        return modelAndView;
    }

    @DeleteMapping("{id}")
    public String deleteAdept(@PathVariable Long id) {
        Adept adept = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Adept power " + id + " not found"));
        repository.delete(adept);
        return "redirect:/adepts";
    }

}
