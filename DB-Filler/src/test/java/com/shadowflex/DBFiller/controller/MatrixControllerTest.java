package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.entity.MatrixFactory;
import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Matrix;
import com.shadowflex.DBFiller.repository.MatrixRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.hamcrest.Matchers.containsString;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(MatrixController.class)
class MatrixControllerTest {
    private final String baseUri = "/matrix";
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private MatrixRepository repository;
    private Matrix matrix1;
    private Matrix matrix2;

    @BeforeEach
    void setUp() {
        matrix1 = MatrixFactory.getMatrix(1L);
        matrix2 = MatrixFactory.getMatrix(2L);
    }

    @Test
    void home_success() throws Exception {
        Mockito.when(repository.findAll()).thenReturn(List.of(matrix1, matrix2));

        mockMvc.perform(get(baseUri)
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("matrix/index"))
                .andExpect(content().string(containsString("Name 2"))
                );
    }

    @Test
    void newMatrixForm_success() throws Exception {
        mockMvc.perform(get(baseUri + "/new")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("matrix/new"))
                .andExpect(content().string(containsString("Создать")));
    }

    @Test
    void editMatrixForm_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(matrix1));

        mockMvc.perform(get(baseUri + "/" + id + "/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("matrix/edit"))
                .andExpect(content().string(containsString("Изменить")));
    }

    @Test
    void editMatrixForm_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(get(baseUri + "/" + id + "/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Matrix action " + id + " not found"
                ));
    }

    @Test
    void saveMatrix_success() throws Exception {
        Mockito.when(repository.save(Mockito.any(Matrix.class))).thenAnswer(i -> i.getArguments()[0]);

        // TODO
        mockMvc.perform(post(baseUri)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name"))
//                        .param("cost", "Стоимость")
//                        .param("activation", "MIN"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void saveMatrix_invalidForm() throws Exception {
        Mockito.when(repository.save(Mockito.any(Matrix.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(post(baseUri)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name"))
//                        .param("cost", "Стоимость")
//                        .param("activation", "MIN"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateMatrix_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(matrix1));
        Mockito.when(repository.save(Mockito.any(Matrix.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name"))
//                        .param("cost", "Стоимость")
//                        .param("activation", "MIN"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void updateMatrix_invalidForm() throws Exception {
        final long id = 1L;

        Mockito.when(repository.save(Mockito.any(Matrix.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name"))
//                        .param("cost", "Стоимость")
//                        .param("activation", "MIN"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateMatrix_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name"))
//                        .param("cost", "Стоимость")
//                        .param("activation", "MIN"))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Matrix action " + id + " not found"
                ));
    }

    @Test
    void deleteMatrix_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(matrix1));

        mockMvc.perform(delete(baseUri + "/" + id))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void deleteMatrix_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(delete(baseUri + "/" + id))
                .andExpect(status().isNotFound());
    }
}