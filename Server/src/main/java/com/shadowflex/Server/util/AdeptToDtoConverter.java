package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.AdeptDTO;
import com.shadowflex.Server.model.Adept;
import org.springframework.stereotype.Component;

@Component
public class AdeptToDtoConverter {
    public AdeptDTO convert(Adept adept, Language lang) {
        // TODO: nullpointer exceptions??
        AdeptDTO dto = new AdeptDTO();
        dto.setCost(adept.getCost());
        dto.setActivation(formatActivation(adept));
        dto.setName(lang == Language.ru ? adept.getNameRu() : adept.getNameEn());
        dto.setDescription(lang == Language.ru ? adept.getDescriptionRu() : adept.getDescriptionEn());
        return dto;
    }

    private static String formatActivation(Adept adept) {
        return switch (adept.getActivation()) {
            case MAJ -> "Major action";
            case MIN -> "Minor action";
            case PAS -> "Passive";
        };
    }
}
