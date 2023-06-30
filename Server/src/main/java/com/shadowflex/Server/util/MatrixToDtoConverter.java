package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.MatrixDTO;
import com.shadowflex.Server.model.Matrix;
import org.springframework.stereotype.Component;

@Component
public class MatrixToDtoConverter {
    public MatrixDTO convert(Matrix matrix, Language lang) {
        // TODO: nullpointer exceptions??
        return MatrixDTO.builder()
                .legal(matrix.getIsLegal() ? "LEGAL" : "ILLEGAL")
                .access(matrix.getAccess().toString())
                .name(lang == Language.ru ? matrix.getNameRu() : matrix.getNameEn())
                .description(lang == Language.ru ? matrix.getDescriptionRu() : matrix.getDescriptionEn())
                .check(lang == Language.ru ? matrix.getCheckRu() : matrix.getCheckEn())
                .type(matrix.getType().name())
                .build();
    }
}
