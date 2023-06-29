package com.shadowflex.Server.util;

import com.shadowflex.Server.dto.MatrixDTO;
import com.shadowflex.Server.exception.InvalidLanguageException;
import com.shadowflex.Server.model.Matrix;

public class MatrixToDtoConverter {
    public MatrixDTO convert(Matrix matrix, Language lang) {
        MatrixDTO matrixDTO = new MatrixDTO();

        matrixDTO.setLegal((matrix.getIsLegal()) ? "LEGAL" : "ILLEGAL");

        matrixDTO.setAccess(matrix.getAccess().toString());

        switch (lang) {
            case ru -> {
                matrixDTO.setName(matrix.getNameRu());
                matrixDTO.setDescription(matrix.getDescriptionRu());
                matrixDTO.setCheck(matrix.getCheckRu());
            }
            case en -> {
                matrixDTO.setName(matrix.getNameEn());
                matrixDTO.setDescription(matrix.getDescriptionEn());
                matrixDTO.setCheck(matrix.getCheckEn());
            }
            default ->
                    throw new InvalidLanguageException("Invalid language: " + lang.name());
        }

        return matrixDTO;
    }
}
