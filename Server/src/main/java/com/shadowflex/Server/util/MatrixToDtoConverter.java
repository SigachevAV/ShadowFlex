package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.MatrixDTO;
import com.shadowflex.Server.dto.MatrixSimpleDTO;
import com.shadowflex.Server.model.Matrix;
import org.springframework.stereotype.Component;

@Component
public class MatrixToDtoConverter {
    public MatrixDTO convert(Matrix matrix, Language lang) {
        return MatrixDTO.builder()
                .legal(matrix.getIsLegal() ? "Legal" : "Illegal")
                .access(matrix.getAccess().toString())
                .name(lang == Language.ru ? matrix.getNameRu() : matrix.getNameEn())
                .description(lang == Language.ru ? matrix.getDescriptionRu() : matrix.getDescriptionEn())
                .check(lang == Language.ru ? matrix.getCheckRu() : matrix.getCheckEn())
                .type(formatType(matrix.getType()))
                .build();
    }

    public MatrixSimpleDTO convertToSimple(Matrix matrix, Language lang) {
        return MatrixSimpleDTO.builder()
                .id(matrix.getId())
                .name(lang == Language.ru ? matrix.getNameRu() : matrix.getNameEn())
                .build();
    }

    private String formatType(Matrix.Type type) {
        return switch (type) {
            case MAJOR -> "Major";
            case MINOR -> "Minor";
        };
    }
}
