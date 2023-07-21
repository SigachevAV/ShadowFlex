package com.shadowflex.Server.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MatrixDTO implements Serializable {
    private String name;
    private String access;
    private String legal;
    private String check;
    private String description;
    private String type;
}
