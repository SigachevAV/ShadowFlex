package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.MatrixDTO;
import com.shadowflex.Server.model.Matrix;
import org.springframework.stereotype.Component;

@Component
public class MatrixToDtoConverter {
    public MatrixDTO convert(Matrix matrix, Language lang) {
        // TODO: nullpointer exceptions??
        MatrixDTO matrixDTO = new MatrixDTO();
        matrixDTO.setLegal(matrix.getIsLegal() ? "LEGAL" : "ILLEGAL");
        matrixDTO.setAccess(matrix.getAccess().toString());
        matrixDTO.setName(lang == Language.ru ? matrix.getNameRu() : matrix.getNameEn());
        matrixDTO.setDescription(lang == Language.ru ? matrix.getDescriptionRu() : matrix.getDescriptionEn());
        matrixDTO.setCheck(lang == Language.ru ? matrix.getCheckRu() : matrix.getCheckEn());
        return matrixDTO;
    }
}
