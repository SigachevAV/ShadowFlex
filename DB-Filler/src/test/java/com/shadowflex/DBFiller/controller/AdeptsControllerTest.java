package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.entity.AdeptsFactory;
import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Adept;
import com.shadowflex.DBFiller.repository.AdeptRepository;
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

@WebMvcTest(AdeptsController.class)
class AdeptsControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private AdeptRepository repository;
    private Adept adept1;
    private Adept adept2;

    @BeforeEach
    void setUp() {
        adept1 = AdeptsFactory.getAdept(1L);
        adept2 = AdeptsFactory.getAdept(2L);
    }

    @Test
    void home_success() throws Exception {
        Mockito.when(repository.findAll()).thenReturn(List.of(adept1, adept2));

        mockMvc.perform(get("/adepts")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("adepts/index"))
                .andExpect(content().string(containsString("Name 2"))
                );
    }

    @Test
    void newAdeptForm_success() throws Exception {
        mockMvc.perform(get("/adepts/new")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("adepts/new"))
                .andExpect(content().string(containsString("Создать")));
    }

    @Test
    void editAdeptForm_success() throws Exception {
        Mockito.when(repository.findById(1L)).thenReturn(Optional.of(adept1));

        mockMvc.perform(get("/adepts/1/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("adepts/edit"))
                .andExpect(content().string(containsString("Изменить")));
    }

    @Test
    void editAdeptForm_invalidId() throws Exception {
        Mockito.when(repository.findById(3L)).thenReturn(Optional.empty());

        mockMvc.perform(get("/adepts/3/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Adept power 3 not found"
                ));
    }

    @Test
    void saveAdept_success() throws Exception {
        Mockito.when(repository.save(adept1)).thenReturn(adept1);

        mockMvc.perform(post("/adepts")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя 1")
                        .param("nameEn", "Name 1")
                        .param("cost", "Стоимость 1")
                        .param("activation", "MIN"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void saveAdept_invalidForm() throws Exception {
        Mockito.when(repository.save(adept1)).thenReturn(adept1);

        mockMvc.perform(post("/adepts")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name 1")
                        .param("cost", "Стоимость 1")
                        .param("activation", "MIN"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateAdept_success() throws Exception {
        Mockito.when(repository.findById(1L)).thenReturn(Optional.of(adept1));
        Mockito.when(repository.save(adept1)).thenReturn(adept1);

        mockMvc.perform(put("/adepts/1")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя 1")
                        .param("nameEn", "Name 1")
                        .param("cost", "Стоимость 1")
                        .param("activation", "MIN"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void updateAdept_invalidForm() throws Exception {
        Mockito.when(repository.save(adept1)).thenReturn(adept1);

        mockMvc.perform(put("/adepts/1")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name 1")
                        .param("cost", "Стоимость 1")
                        .param("activation", "MIN"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateAdept_invalidId() throws Exception {
        Mockito.when(repository.findById(3L)).thenReturn(Optional.empty());

        mockMvc.perform(put("/adepts/3")
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя 1")
                        .param("nameEn", "Name 1")
                        .param("cost", "Стоимость 1")
                        .param("activation", "MIN"))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Adept power 3 not found"
                ));
    }

    @Test
    void deleteAdept_success() throws Exception {
        Mockito.when(repository.findById(1L)).thenReturn(Optional.of(adept1));

        mockMvc.perform(delete("/adepts/1"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void deleteAdept_invalidId() throws Exception {
        Mockito.when(repository.findById(3L)).thenReturn(Optional.empty());

        mockMvc.perform(delete("/adepts/3"))
                .andExpect(status().isNotFound());
    }
}