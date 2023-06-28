package com.shadowflex.Server.model;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Entity
@Table(name = "spell")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Spell implements Serializable {
    public enum SpellCategory {COM, DET, HEAL, ILL, MAN}
    public enum SpellDamage {P, S, SPEC}
    public enum SpellDuration {I, S, L, P}
    public enum SpellRange {LOS, LOSA, TOUCH, SPEC}
    public enum SpellType {P, M}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private SpellCategory category;
    private String nameRu;
    private String nameEn;
    @Enumerated(EnumType.STRING)
    private SpellRange range;
    @Enumerated(EnumType.STRING)

    private SpellDuration duration;
    @Enumerated(EnumType.STRING)
    private SpellType type;
    private Integer dv;
    @Enumerated(EnumType.STRING)
    private SpellDamage damage;
    private String descriptionRu;
    private String descriptionEn;
}
