package com.ptithcm.intern_project.jpa.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.jpa.model.enums.Specialty;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "user_has_specialties")
public class UserHasSpecialties {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_info_id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    UserInfo userInfo;

    @Column(name = "specialty", nullable = false)
    @Enumerated(EnumType.STRING)
    Specialty specialty;

    @Column(name = "level", nullable = false, columnDefinition = "DEFAULT 1")
    @Min(1)
    @Max(5)
    int level;

    @Column(name = "note")
    String note;
}
