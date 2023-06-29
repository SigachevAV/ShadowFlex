package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.SpellDTO;
import com.shadowflex.Server.model.Spell;
import org.springframework.stereotype.Component;

@Component
public class SpellToDtoConverter {
    public SpellDTO convert(Spell spell, Language lang) {
        // TODO: nullpointer exceptions??
        SpellDTO spellDTO = SpellDTO.builder()
                .duration(spell.getDuration().name())
                .type(spell.getType().name())
                .dv(spell.getDv())
                .build();
        spellDTO.setDamage(formatDamage(spell));
        spellDTO.setRange(formatRange(spell));
        spellDTO.setName(lang == Language.ru ? spell.getNameRu() : spell.getNameEn());
        spellDTO.setDescription(lang == Language.ru ? spell.getDescriptionRu() : spell.getDescriptionEn());
        return spellDTO;
    }

    private static String formatRange(Spell spell) {
        return switch (spell.getRange()) {
            case LOS -> "Los";
            case LOSA -> "Los(A)";
            case TOUCH -> "Touch";
            case SPEC -> "Special";
        };
    }

    private static String formatDamage(Spell spell) {
        return switch (spell.getDamage()) {
            case P -> "P";
            case S -> "S";
            case SPEC -> "Special";

        };
    }
}
