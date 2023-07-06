package com.shadowflex.DBFiller.controller;

import com.shadowflex.DBFiller.config.WebConfig;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest
@ContextConfiguration(classes = {WebConfig.class})
public class HomeControllerTest {
    private final String baseUri = "/";
    @Autowired
    private MockMvc mockMvc;

    @Test
    public void home_success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get(baseUri))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Редактировать заклинания")));
    }
}
