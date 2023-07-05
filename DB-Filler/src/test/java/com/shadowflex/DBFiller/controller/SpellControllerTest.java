package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.entity.SpellsFactory;
import com.shadowflex.DBFiller.exception.NotFoundException;
import com.shadowflex.DBFiller.model.Spell;
import com.shadowflex.DBFiller.repository.SpellRepository;
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

@WebMvcTest(SpellController.class)
class SpellControllerTest {
    private final String baseUri = "/spells";
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private SpellRepository repository;
    private Spell spell1;
    private Spell spell2;

    @BeforeEach
    void setUp() {
        spell1 = SpellsFactory.getSpell(1L);
        spell2 = SpellsFactory.getSpell(2L);
    }

    @Test
    void home_success() throws Exception {
        Mockito.when(repository.findAll()).thenReturn(List.of(spell1, spell2));

        mockMvc.perform(get(baseUri)
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("spells/index"))
                .andExpect(content().string(containsString("Name 2"))
                );
    }

    @Test
    void newSpellForm_success() throws Exception {
        mockMvc.perform(get(baseUri + "/new")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("spells/new"))
                .andExpect(content().string(containsString("Создать")));
    }

    @Test
    void editSpellForm_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(spell1));

        mockMvc.perform(get(baseUri + "/" + id + "/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("spells/edit"))
                .andExpect(content().string(containsString("Изменить")));
    }

    @Test
    void editSpellForm_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(get(baseUri + "/" + id + "/edit")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Spell " + id + " not found"
                ));
    }

    @Test
    void saveSpell_success() throws Exception {
        Mockito.when(repository.save(Mockito.any(Spell.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(post(baseUri)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("dv", "5")
                        .param("damage", "SPEC"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void saveSpell_invalidForm() throws Exception {
        Mockito.when(repository.save(Mockito.any(Spell.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(post(baseUri)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("dv", "")
                        .param("damage", "SPEC"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Поле не должно быть пустым!")));
    }

    @Test
    void updateSpell_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(spell1));
        Mockito.when(repository.save(Mockito.any(Spell.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("dv", "5")
                        .param("damage", "SPEC"))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void updateSpell_invalidForm() throws Exception {
        final long id = 1L;

        Mockito.when(repository.save(Mockito.any(Spell.class))).thenAnswer(i -> i.getArguments()[0]);

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "")
                        .param("nameEn", "Name")
                        .param("dv", "5")
                        .param("damage", "SPEC"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Название не должно быть пустым!")));
    }

    @Test
    void updateSpell_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(put(baseUri + "/" + id)
                        .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                        .param("nameRu", "Имя")
                        .param("nameEn", "Name")
                        .param("dv", "5")
                        .param("damage", "SPEC"))
                .andExpect(status().isNotFound())
                .andExpect(result -> assertTrue(result.getResolvedException() instanceof NotFoundException))
                .andExpect(result -> assertEquals(
                        Objects.requireNonNull(result.getResolvedException()).getMessage(), "Spell " + id + " not found"
                ));
    }

    @Test
    void deleteSpell_success() throws Exception {
        final long id = 1L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.of(spell1));

        mockMvc.perform(delete(baseUri + "/" + id))
                .andExpect(status().isMovedTemporarily());
    }

    @Test
    void deleteSpell_invalidId() throws Exception {
        final long id = 3L;

        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());

        mockMvc.perform(delete(baseUri + "/" + id))
                .andExpect(status().isNotFound());
    }
}