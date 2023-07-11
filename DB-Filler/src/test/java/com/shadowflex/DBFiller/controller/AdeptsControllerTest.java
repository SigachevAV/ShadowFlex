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
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(AdeptsController.class)
class AdeptsControllerTest {
    private final String baseUri = "/adepts";
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

        mockMvc.perform(get(baseUri)
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("adepts/index"))
                .andExpect(content().string(containsString("Name 2"))
                );
    }

    @Test
    void newAdeptForm_success() throws Exception {
        mockMvc.perform(get(baseUri + "/new")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("adepts/new"))
                .andExpect(content().string(containsString("Создать")));
    }

    @Test
    void editAdeptForm_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(adept1));

        mockMvc.perform(get(baseUri + "/" + id + "/edit")
                        .contentType(MediaType.TEXT_HTML)
                        .with(csrf()))
                .andExpect(status().isOk())
                .andExpect(view().name("adepts/edit"))
                .andExpect(content().string(containsString("Изменить")));
    }

    @Test
    void editAdeptForm_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(get(baseUri + "/" + id + "/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Adept power " + id + " not found"
                ));
    }

    @Test
    void saveAdept_success() throws Exception {
        Mockito.when(repository.save(Mockito.any(Adept.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(post(baseUri)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("cost", "Стоимость")
                        .param("activation", "MIN"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void saveAdept_invalidForm() throws Exception {
        Mockito.when(repository.save(Mockito.any(Adept.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(post(baseUri)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name")
                        .param("cost", "Стоимость")
                        .param("activation", "MIN"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateAdept_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(adept1));
        Mockito.when(repository.save(Mockito.any(Adept.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("cost", "Стоимость")
                        .param("activation", "MIN"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void updateAdept_invalidForm() throws Exception {
        final long id = 1L;

        Mockito.when(repository.save(Mockito.any(Adept.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name")
                        .param("cost", "Стоимость")
                        .param("activation", "MIN")
                        .with(csrf()))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateAdept_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("cost", "Стоимость")
                        .param("activation", "MIN"))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Adept power " + id + " not found"
                ));
    }

    @Test
    void deleteAdept_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(adept1));

        mockMvc.perform(delete(baseUri + "/" + id))
                .andExpect(status().isOk());
    }

    @Test
    void deleteAdept_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(delete(baseUri + "/" + id))
                .andExpect(status().isNotFound());
    }
}