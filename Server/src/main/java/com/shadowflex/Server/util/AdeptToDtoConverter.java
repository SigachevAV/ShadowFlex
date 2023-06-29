package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.AdeptDTO;
import com.shadowflex.Server.exception.InvalidLanguageException;
import com.shadowflex.Server.model.Adept;

public class AdeptToDtoConverter {
    public AdeptDTO convert(Adept adept, Language lang) {
        AdeptDTO dto = new AdeptDTO();

        dto.setCost(adept.getCost());
        dto.setActivation(switch (adept.getActivation()) {
            case MAJ -> "Major action";
            case MIN -> "Minor action";
            case PAS -> "Passive";
        });

        // localization
        switch (lang) {
            case ru -> {
                dto.setName(adept.getNameRu());
                dto.setDescription(adept.getDescriptionRu());
            }
            case en -> {
                dto.setName(adept.getNameEn());
                dto.setDescription(adept.getDescriptionEn());
            }
            default ->
                    throw new InvalidLanguageException("Invalid language: " + lang.name());
        }

        return dto;
    }
}
