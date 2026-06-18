package com.smart.reversecounting.infrastructure.web;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class ReverseDifferenceControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void calculatesReverseDifferenceFromJsonRequest() throws Exception {
        mockMvc.perform(post("/api/v1/reverse-difference")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {
                                  "number": "1.2"
                                }
                                """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.originalInput").value("1.2"))
                .andExpect(jsonPath("$.normalizedNumber").value("12"))
                .andExpect(jsonPath("$.reversedNumber").value("21"))
                .andExpect(jsonPath("$.difference").value("9"));
    }

    @Test
    void returnsBadRequestWhenInputHasNoDigit() throws Exception {
        mockMvc.perform(post("/api/v1/reverse-difference")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {
                                  "number": "abc"
                                }
                                """))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.message").value("number must contain at least one digit"));
    }
}
