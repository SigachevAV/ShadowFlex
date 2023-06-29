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
public class SpellDTO implements Serializable {
    private String name;
    private String range;
    private String duration;
    private String type;
    private Integer dv;
    private String damage;
    private String description;
}
