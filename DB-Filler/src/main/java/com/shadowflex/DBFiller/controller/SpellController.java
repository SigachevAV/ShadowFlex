package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Spell;
import com.shadowflex.DBFiller.repository.SpellRepository;
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
@RequestMapping("/spells")
@RequiredArgsConstructor
public class SpellController {
    private final SpellRepository repository;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("spells", repository.findAll());
        return "spells/index";
    }

    @GetMapping("/new")
    public String newSpellForm(Model model) {
        model.addAttribute("spell", new Spell());
        return "spells/new";
    }

    @GetMapping("/{id}/edit")
    public String editSpellForm(Model model, @PathVariable Long id) {
        Optional<Spell> spellOptional = repository.findById(id);
        if(spellOptional.isEmpty())
            throw new NotFoundException("Spell " + id + " not found");
        model.addAttribute("spell", spellOptional.get());
        return "spells/edit";
    }

    @PostMapping
    public String saveSpell(
            @ModelAttribute("spell") @Valid Spell spell,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors())
            return "spells/new";
        repository.save(spell);
        return "redirect:/spells";
    }

    @PutMapping("/{id}")
    public String updateSpell(
            @PathVariable Long id,
            @ModelAttribute("spell") @Valid Spell spell,
            BindingResult bindingResult) {
        if(bindingResult.hasErrors())
            return "spells/edit";
        repository.findById(id).orElseThrow(() -> new NotFoundException("Spell " + id + " not found"));
        spell.setId(id);
        repository.save(spell);
        return "redirect:/spells";
    }

    @DeleteMapping("{id}")
    public String deleteSpell(@PathVariable Long id) {
        Spell spell = repository.findById(id)
                .orElseThrow(() -> new NotFoundException("Spell " + id + " not found"));
        repository.delete(spell);
        return "redirect:/spells";
    }
}
