package com.shadowflex.Server.entity;

import com.shadowflex.Server.model.Matrix;

public class MatrixFactory {
    public static Matrix getMatrix(Long id) {
        return Matrix.builder()
                .id(id)
                .nameRu("Имя " + id)
                .nameEn("Name " + id)
                .isLegal(true)
                .access(new Matrix.Access(true, false, true))
                .checkEn("Check " + id)
                .checkRu("Проверка " + id)
                .descriptionRu("Описание " + id)
                .descriptionEn("Description " + id)
                .type(Matrix.Type.values()[(int) (id % Matrix.Type.values().length)])
                .build();

    }
}
