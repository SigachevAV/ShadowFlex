package com.shadowflex.Server.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdeptDTO {
    private String name;
    private String cost;
    private String activation;
    private String description;
}
