package com.shadowflex.Server.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "adept_power")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Adept {
    public enum Activation {MIN, MAJ, PAS};

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nameRu;
    private String nameEn;
    private String cost;
    @Enumerated(EnumType.STRING)
    private Activation activation;
    private String descriptionRu;
    private String descriptionEn;
}
