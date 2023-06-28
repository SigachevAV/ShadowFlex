package com.shadowflex.Server.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SpellDTO {
    private String name;
    private String range;
    private String duration;
    private String type;
    private Integer dv;
    private String damage;
    private String description;
}
