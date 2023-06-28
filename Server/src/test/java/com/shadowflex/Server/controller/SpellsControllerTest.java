package com.shadowflex.Server.controller;

import com.shadowflex.Server.model.Spell;
import com.shadowflex.Server.repository.SpellRepository;
import com.shadowflex.Server.util.SpellToDtoConverter;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Optional;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@ExtendWith(SpringExtension.class)
@WebMvcTest(SpellsController.class)
@Import(SpellToDtoConverter.class)
class SpellsControllerTest {
    private final String basePath = "/spells";
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private SpellRepository spellRepository;

    @BeforeEach
    void setUp() {
        Spell testSpell = Spell.builder()
                .id(1L)
                .nameRu("Заклинание")
                .nameEn("Spell")
                .duration(Spell.SpellDuration.S)
                .damage(Spell.SpellDamage.P)
                .type(Spell.SpellType.P)
                .category(Spell.SpellCategory.COM)
                .dv(1)
                .range(Spell.SpellRange.LOS)
                .descriptionEn("Some text")
                .descriptionRu("Некоторый текст")
                .build();
        Mockito.when(spellRepository.findById(1L)).thenReturn(Optional.of(testSpell));
    }

    @Test
    void getById_ru_success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "ru")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Заклинание")));
    }

    @Test
    void getById_en_success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "en")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$", notNullValue()))
                .andExpect(jsonPath("$.name", is("Spell")));
    }

    @Test
    void getById_invalidLang_success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                        .get(basePath + "/1")
                        .param("lang", "br")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().is4xxClientError());
    }
}