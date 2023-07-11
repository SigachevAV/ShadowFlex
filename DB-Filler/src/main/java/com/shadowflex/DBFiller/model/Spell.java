package com.shadowflex.DBFiller.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Table(name = "spell")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Spell implements Serializable {
    public enum Category {COM, DET, HEAL, ILL, MAN}
    public enum Damage {P, S, SPEC}
    public enum Duration {I, S, L, P}
    public enum Range {LOS, LOSA, TOUCH, SPEC}
    public enum Type {P, M}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    // TODO notnull?
    // TODO direct/indirect combat?
    @Enumerated(EnumType.STRING)
    private Category category;
    @NotBlank(message = "Название не должно быть пустым!")
    @Size(max=256, message = "Слишком длинное название!")
    private String nameRu;
    @NotBlank(message = "Название не должно быть пустым!")
    @Size(max=256, message = "Слишком длинное название!")
    private String nameEn;
    @Enumerated(EnumType.STRING)
    private Range range;
    @Enumerated(EnumType.STRING)
    private Duration duration;
    @Enumerated(EnumType.STRING)
    private Type type;
    @NotNull(message = "Поле не должно быть пустым!")
    @Min(value = 0, message = "Значение не может быть отрицательным!")
    private Integer dv;
    @Enumerated(EnumType.STRING)
    private Damage damage;
    private String descriptionRu;
    private String descriptionEn;
}