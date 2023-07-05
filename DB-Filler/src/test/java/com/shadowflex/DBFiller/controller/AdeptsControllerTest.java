package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.entity.AdeptsFactory;
import com.shadowflex.DBFiller.model.Adept;
import com.shadowflex.DBFiller.repository.AdeptRepository;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(AdeptsController.class)
class AdeptsControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private AdeptRepository repository;
    private Adept adept1;
    private Adept adept2;

    {
        adept1 = AdeptsFactory.getAdept(1L);
        adept2 = AdeptsFactory.getAdept(2L);
    }

    @Test
    void home() throws Exception {
        Mockito.when(repository.findAll()).thenReturn(List.of(adept1, adept2));

        mockMvc.perform(get("/adepts")
                        .contentType(MediaType.TEXT_HTML))
                .andExpect(status().isOk())
                .andExpect(view().name("index"))
                .andExpect(content().string(containsString("Name 2"))
                );
    }

    @Test
    void newAdeptForm() {
    }

    @Test
    void editAdeptForm() {
    }

    @Test
    void saveAdept() {
    }

    @Test
    void deleteAdept() {
    }
}