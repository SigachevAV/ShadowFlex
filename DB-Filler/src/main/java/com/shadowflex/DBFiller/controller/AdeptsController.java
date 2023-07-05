package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.repository.AdeptRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String newAdeptForm() {
        return "adepts/edit";
    }

    @GetMapping("/{id}/edit")
    public String editAdeptForm() {
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
