package com.shadowflex.Server.entity;

import com.shadowflex.Server.model.Adept;

public class AdeptsFactory {
    public static Adept getAdept(Long id) {
        return Adept.builder()
                .id(id)
                .nameRu("Имя " + id)
                .nameEn("Name " + id)
                .cost("Стоимость " + id)
                .activation(Adept.Activation.values()[(int) (id % Adept.Activation.values().length)])
                .descriptionRu("Описание " + id)
                .descriptionEn("Description " + id)
                .build();
    }
}
