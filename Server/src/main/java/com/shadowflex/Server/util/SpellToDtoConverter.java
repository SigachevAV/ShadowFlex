package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.SpellDTO;
import com.shadowflex.Server.dto.SpellSimpleDTO;
import com.shadowflex.Server.model.Spell;
import org.springframework.stereotype.Component;

@Component
public class SpellToDtoConverter {
    public SpellDTO convert(Spell spell, Language lang) {
        // TODO: nullpointer exceptions??
        return SpellDTO.builder()
                .duration(spell.getDuration().name())
                .type(spell.getType().name())
                .dv(spell.getDv())
                .damage(formatDamage(spell.getDamage()))
                .range(formatRange(spell.getRange()))
                .name(lang == Language.ru ? spell.getNameRu() : spell.getNameEn())
                .description(lang == Language.ru ? spell.getDescriptionRu() : spell.getDescriptionEn())
                .build();
    }

    public SpellSimpleDTO convertToSimple(Spell spell, Language lang) {
        return SpellSimpleDTO.builder()
                .id(spell.getId())
                .name(lang == Language.ru ? spell.getNameRu() : spell.getNameEn())
                .category(formatCategory(spell.getCategory()))
                .build();
    }

    private String formatCategory(Spell.SpellCategory category) {
        return switch (category) {
            case COM -> "COMBAT";
            case DET -> "DETECTION";
            case ILL -> "ILLUSION";
            case MAN -> "MANIPULATION";
            case HEAL -> "HEALTH";
        };
    }

    private static String formatRange(Spell.SpellRange range) {
        return switch (range) {
            case LOS -> "Los";
            case LOSA -> "Los(A)";
            case TOUCH -> "Touch";
            case SPEC -> "Special";
        };
    }

    private static String formatDamage(Spell.SpellDamage damage) {
        return switch (damage) {
            case P -> "P";
            case S -> "S";
            case SPEC -> "Special";

        };
    }
}
