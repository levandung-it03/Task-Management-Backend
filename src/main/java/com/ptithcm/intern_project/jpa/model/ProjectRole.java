package com.ptithcm.intern_project.jpa.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.jpa.model.enums.RoleOnEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "project_role")
public class ProjectRole {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_info_id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    UserInfo userInfo;

    @ManyToOne
    @JoinColumn(name = "project_id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    Project project;

    @Column(name = "role", nullable = false)
    @Enumerated(EnumType.STRING)
    RoleOnEntity role;
}
