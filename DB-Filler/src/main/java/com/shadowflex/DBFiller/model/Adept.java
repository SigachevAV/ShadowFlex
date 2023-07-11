package com.shadowflex.DBFiller.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Table(name = "adept_power")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Adept implements Serializable {
    public enum Activation {MIN, MAJ, PAS}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Название не должно быть пустым!")
    @Size(max=256, message = "Слишком длинное название!")
    private String nameRu;
    @NotBlank(message = "Название не должно быть пустым!")
    @Size(max=256, message = "Слишком длинное название!")
    private String nameEn;
    @NotBlank(message = "Цена не должна быть пустой!")
    @Size(max=256, message = "Слишком длинная цена!")
    private String cost;
    @Enumerated(EnumType.STRING)
    private Activation activation;

    private String descriptionRu;
    private String descriptionEn;
}