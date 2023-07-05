package com.shadowflex.DBFiller.entity;

import com.shadowflex.DBFiller.model.Adept;

public class AdeptsFactory {
    public static Adept getAdept(Long id) {
        return Adept.builder()
                .id(id)
                .nameRu("Имя " + id)
                .nameEn("Name " + id)
                .cost("Стоимость " + id)
                .activation(Adept.Activation.values()[(int) (id % 3L)])
                .descriptionRu("Описание " + id)
                .descriptionEn("Description " + id)
                .build();
    }
}
