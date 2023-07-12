package com.shadowflex.Server.controller;

import com.shadowflex.Server.entity.SpellsFactory;
import com.shadowflex.Server.exception.InvalidLanguageException;
import com.shadowflex.Server.exception.NotFoundException;
import com.shadowflex.Server.model.Spell;
import com.shadowflex.Server.repository.SpellRepository;
import com.shadowflex.Server.util.SpellToDtoConverter;
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

@WebMvcTest(SpellsController.class)
@Import(SpellToDtoConverter.class)
class SpellsControllerTest {
    private final String basePath = "/spells";
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private SpellRepository spellRepository;
    private final Spell spell1;
    private final Spell spell2;

    {
        spell1 = SpellsFactory.getSpell(1L);
        spell2 = SpellsFactory.getSpell(2L);
    }

    @Test
    void getById_ru_success() throws Exception {
        Mockito.when(spellRepository.findById(1L)).thenReturn(Optional.of(spell1));

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
        Mockito.when(spellRepository.findById(1L)).thenReturn(Optional.of(spell1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Name 1")));
    }

    @Test
    void getByName_ru_success() throws Exception {
        Mockito.when(spellRepository.findByNameRu("Имя 1")).thenReturn(Optional.of(spell1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/search")
                        .param("name", "Имя 1")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Имя 1")));
    }

    @Test
    void getByName_en_success() throws Exception {
        Mockito.when(spellRepository.findByNameEn("Name 1")).thenReturn(Optional.of(spell1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/search")
                        .param("name", "Name 1")
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Name 1")));
    }

    @Test
    void getByName_ru_invalidName() throws Exception {
        Mockito.when(spellRepository.findByNameRu("ошибка")).thenReturn(Optional.empty());

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/search")
                        .param("name", "ошибка")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Spell ошибка not found"
                ));
    }

    @Test
    void getByName_ru_invalidLang() throws Exception {
        Mockito.when(spellRepository.findByNameRu("ошибка")).thenReturn(Optional.empty());

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

    @Test
    void getById_invalidId() throws Exception {
        Mockito.when(spellRepository.findById(1L)).thenReturn(Optional.of(spell1));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/0")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Spell 0 not found"
                ));
    }

    @Test
    void getById_invalidLang() throws Exception {
        Mockito.when(spellRepository.findById(1L)).thenReturn(Optional.of(spell1));

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
        Mockito.when(spellRepository.findAll()).thenReturn(List.of(spell1, spell2));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath)
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.HEAL", hasSize(1)))
                .andExpect(jsonPath("$.DET", hasSize(1)))
                .andExpect(jsonPath("$.DET.[0].name", is("Имя 1")));
    }

    @Test
    void getAll_en_success() throws Exception {
        Mockito.when(spellRepository.findAll()).thenReturn(List.of(spell1, spell2));

        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath)
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.DET", hasSize(1)))
                .andExpect(jsonPath("$.HEAL", hasSize(1)))
                .andExpect(jsonPath("$.HEAL.[0].name", is("Name 2")));
    }

    @Test
    void getAll_invalidLang() throws Exception {
        Mockito.when(spellRepository.findAll()).thenReturn(List.of(spell1, spell2));

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