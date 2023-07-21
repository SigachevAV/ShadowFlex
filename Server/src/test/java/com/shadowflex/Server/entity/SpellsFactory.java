package com.shadowflex.Server.entity;

import com.shadowflex.Server.model.Spell;

public class SpellsFactory {
    public static Spell getSpell(Long id) {
        return Spell.builder()
                .id(id)
                .category(Spell.SpellCategory.values()[(int) (id % Spell.SpellCategory.values().length)])
                .nameRu("Имя " + id)
                .nameEn("Name " + id)
                .range(Spell.SpellRange.values()[(int) (id % Spell.SpellRange.values().length)])
                .duration(Spell.SpellDuration.values()[(int) (id % Spell.SpellDuration.values().length)])
                .type(Spell.SpellType.values()[(int) (id % Spell.SpellType.values().length)])
                .dv((int)(1 + id % 5L))
                .damage(Spell.SpellDamage.values()[(int) (id % Spell.SpellDamage.values().length)])
                .descriptionRu("Описание " + id)
                .descriptionEn("Description " + id)
                .build();
    }
}
