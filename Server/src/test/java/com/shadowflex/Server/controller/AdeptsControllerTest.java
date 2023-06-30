package com.shadowflex.Server.controller;

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
        adept1 = Adept.builder()
                .nameRu("Имя")
                .nameEn("Name")
                .cost("Cost")
                .activation(Adept.Activation.MAJ)
                .descriptionEn("Text")
                .descriptionRu("Текст")
                .build();
        adept2 = Adept.builder()
                .nameRu("Имя (2)")
                .nameEn("Name (2)")
                .cost("Cost (2)")
                .activation(Adept.Activation.MAJ)
                .descriptionEn("Text (2)")
                .descriptionRu("Текст (2)")
                .build();
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
                .andExpect(jsonPath("$.name", is("Имя")));
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
                .andExpect(jsonPath("$.name", is("Name")));
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
                .andExpect(jsonPath("$.[1].name", is("Имя (2)")));
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
                .andExpect(jsonPath("$.[1].name", is("Name (2)")));
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
}