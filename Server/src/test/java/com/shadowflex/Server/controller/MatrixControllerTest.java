package com.shadowflex.Server.controller;

import com.shadowflex.Server.exception.InvalidLanguageException;
import com.shadowflex.Server.exception.NotFoundException;
import com.shadowflex.Server.model.Matrix;
import com.shadowflex.Server.repository.MatrixRepository;
import com.shadowflex.Server.util.MatrixToDtoConverter;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Objects;
import java.util.Optional;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(MatrixController.class)
@Import(MatrixToDtoConverter.class)
class MatrixControllerTest {
    private final String basePath = "/matrix";
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private MatrixRepository matrixRepository;
    private final Matrix matrix;

    {
        matrix = Matrix.builder()
                .id(1L)
                .nameEn("Name")
                .nameRu("Имя")
                .isLegal(Boolean.TRUE)
                .access(new Matrix.Access(true, false, true))
                .checkEn("Check")
                .checkRu("Проверка")
                .descriptionRu("Описание")
                .descriptionEn("Description")
                .build();
    }

    @BeforeEach
    void setUp() {
        Mockito.when(matrixRepository.findById(1L)).thenReturn(Optional.of(matrix));
    }

    @Test
    void getById_ru_success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Имя")))
                .andExpect(jsonPath("$.legal", is("LEGAL")))
                .andExpect(jsonPath("$.access", is("outsider, admin")));
    }

    @Test
    void getById_en_success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Name")));
    }

    @Test
    void getById_invalidId() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/0")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Matrix action 0 not found"
                ));
    }

    @Test
    void getById_invalidLang() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "br")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof InvalidLanguageException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Invalid language br"
                ));
    }
}