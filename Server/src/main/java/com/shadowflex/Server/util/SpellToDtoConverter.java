package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.SpellDTO;
import com.shadowflex.Server.model.Spell;
import org.springframework.stereotype.Component;

@Component
public class SpellToDtoConverter {
    public SpellDTO convert(Spell spell, Language lang) {
        // basic initialisation
        SpellDTO spellDTO = SpellDTO.builder()
                .duration(spell.getDuration().name())
                .type(spell.getType().name())
                .dv(spell.getDv())
                .build();
        spellDTO.setDamage(switch (spell.getDamage()) {
            case P -> "P";
            case S -> "S";
            case SPEC -> "Special";

        });
        spellDTO.setRange(switch (spell.getRange()) {
            case LOS -> "Los";
            case LOSA -> "Los(A)";
            case TOUCH -> "Touch";
            case SPEC -> "Special";
        });

        // localization
        switch (lang) {
            case ru -> {
                spellDTO.setName(spell.getNameRu());
                spellDTO.setDescription(spell.getDescriptionRu());
            }
            case en -> {
                spellDTO.setName(spell.getNameEn());
                spellDTO.setDescription(spell.getDescriptionEn());
            }
            default -> {
                // TODO: lang exception
            }
        }

        return spellDTO;
    }
}
