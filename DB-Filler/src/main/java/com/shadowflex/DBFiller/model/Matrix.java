package com.shadowflex.DBFiller.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Struct;

import java.io.Serializable;

@Entity
@Table(name = "matrix_action")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Matrix implements Serializable {
    @Embeddable
    @Struct(name = "matrix_action_access", attributes = {"outsider", "user", "admin"})
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Access {
        private boolean outsider;
        private boolean user;
        private boolean admin;
    }

    public enum Type {MAJOR, MINOR}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank(message = "Название не должно быть пустым!")
    @Size(max=256, message = "Слишком длинное название!")
    private String nameRu;
    @NotBlank(message = "Название не должно быть пустым!")
    @Size(max=256, message = "Слишком длинное название!")
    private String nameEn;
    private Boolean isLegal;
    @Embedded
    private Access access;
    private String checkRu;
    private String checkEn;
    private String descriptionRu;
    private String descriptionEn;
    @Enumerated(EnumType.STRING)
    private Type type;
}