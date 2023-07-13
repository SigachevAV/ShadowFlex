package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.AdeptDTO;
import com.shadowflex.Server.dto.AdeptSimpleDTO;
import com.shadowflex.Server.model.Adept;
import org.springframework.stereotype.Component;

@Component
public class AdeptToDtoConverter {
    public AdeptDTO convert(Adept adept, Language lang) {
        return AdeptDTO.builder()
                .name(lang == Language.ru ? adept.getNameRu() : adept.getNameEn())
                .description(lang == Language.ru ? adept.getDescriptionRu() : adept.getDescriptionEn())
                .cost(adept.getCost())
                .activation(formatActivation(adept))
                .build();
    }

    public AdeptSimpleDTO convertToSimple(Adept adept, Language lang) {
        return AdeptSimpleDTO.builder()
                .id(adept.getId())
                .name(lang == Language.ru ? adept.getNameRu() : adept.getNameEn())
                .build();
    }

    private static String formatActivation(Adept adept) {
        return switch (adept.getActivation()) {
            case MAJ -> "Major";
            case MIN -> "Minor";
            case PAS -> "Passive";
        };
    }
}
