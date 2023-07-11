package com.shadowflex.Server.model;

import jakarta.persistence.*;
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

        @Override
        public String toString() {
            StringBuilder result = new StringBuilder();
            if(outsider) result.append("outsider");
            if(user) result.append(", user");
            if(admin) result.append(", admin");
            return result.toString();
        }
    }

    public enum Type {MAJOR, MINOR}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nameRu;
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
