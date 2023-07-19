package com.shadowflex.Server.controller;

import com.shadowflex.Server.entity.AdeptsFactory;
import com.shadowflex.Server.exception.InvalidLanguageException;
import com.shadowflex.Server.exception.NotFoundException;
import com.shadowflex.Server.model.Adept;
import com.shadowflex.Server.repository.AdeptRepository;
import com.shadowflex.Server.util.AdeptToDtoConverter;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static org.hamcrest.Matchers.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(AdeptsController.class)
@Import(AdeptToDtoConverter.class)
class AdeptsControllerTest {
    private final String basePath = "/adepts";
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private AdeptRepository adeptRepository;
    private final Adept adept1;
    private final Adept adept2;

    {
        adept1 = AdeptsFactory.getAdept(1L);
        adept2 = AdeptsFactory.getAdept(2L);
    }

    @Test
    void getById_ru_success() throws Exception {
        Mockito.when(adeptRepository.findById(1L)).thenReturn(Optional.of(adept1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Имя 1")));
    }

    @Test
    void getById_en_success() throws Exception {
        Mockito.when(adeptRepository.findById(1L)).thenReturn(Optional.of(adept1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Name 1")));
    }

    @Test
    void getById_invalidId() throws Exception {
        Mockito.when(adeptRepository.findById(1L)).thenReturn(Optional.of(adept1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/0")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Adept's power 0 not found"
                ));
    }

    @Test
    void getById_invalidLang() throws Exception {
        Mockito.when(adeptRepository.findById(1L)).thenReturn(Optional.of(adept1));

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

    @Test
    void getAll_ru_success() throws Exception {
        Mockito.when(adeptRepository.findAll()).thenReturn(List.of(adept1, adept2));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath)
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$.[1].id", is(2)))
                .andExpect(jsonPath("$.[1].name", is("Имя 2")));
    }

    @Test
    void getAll_en_success() throws Exception {
        Mockito.when(adeptRepository.findAll()).thenReturn(List.of(adept1, adept2));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath)
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(2)))
                .andExpect(jsonPath("$.[1].id", is(2)))
                .andExpect(jsonPath("$.[1].name", is("Name 2")));
    }

    @Test
    void getAll_invalidLang() throws Exception {
        Mockito.when(adeptRepository.findAll()).thenReturn(List.of(adept1, adept2));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath)
                        .param("lang", "br")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof InvalidLanguageException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Invalid language br"
                ));
    }

    @Test
    void getByName_ru_success() throws Exception {
        Mockito.when(adeptRepository.findByNameRuContainingIgnoreCase("Имя 1")).thenReturn(List.of(adept1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/search")
                        .param("name", "Имя 1")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$.[0].id", is(1)));
    }

    @Test
    void getByName_en_success() throws Exception {
        Mockito.when(adeptRepository.findByNameEnContainingIgnoreCase("Name 1")).thenReturn(List.of(adept1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/search")
                        .param("name", "Name 1")
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$.[0].id", is(1)));
    }

    @Test
    void getByName_ru_invalidLang() throws Exception {
        Mockito.when(adeptRepository.findByNameRuContainingIgnoreCase("ошибка")).thenReturn(Collections.emptyList());

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/search")
                        .param("name", "ошибка")
                        .param("lang", "br")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof InvalidLanguageException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Invalid language br"
                ));
    }
}