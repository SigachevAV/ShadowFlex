package com.shadowflex.DBFiller.entity;

import com.shadowflex.DBFiller.model.Spell;

public class SpellsFactory {
    public static Spell getSpell(Long id) {
        return Spell.builder()
                .id(id)
                .category(Spell.Category.values()[(int) (id % Spell.Category.values().length)])
                .nameRu("Имя " + id)
                .nameEn("Name " + id)
                .range(Spell.Range.values()[(int) (id % Spell.Range.values().length)])
                .duration(Spell.Duration.values()[(int) (id % Spell.Duration.values().length)])
                .type(Spell.Type.values()[(int) (id % Spell.Type.values().length)])
                .dv((int)(1 + id % 5L))
                .damage(Spell.Damage.values()[(int) (id % Spell.Damage.values().length)])
                .descriptionRu("Описание " + id)
                .descriptionEn("Description " + id)
                .build();
    }
}
