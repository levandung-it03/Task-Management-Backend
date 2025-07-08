package com.ptithcm.intern_project.dataJpa.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "phase")
public class Phase {
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

    @Column(name = "name", nullable = false)
    String name;

    @Column(name = "description", nullable = false)
    String description;

    @Column(name = "start_date", nullable = false, columnDefinition = "DATE DEFAULT NOW()")
    LocalDate startDate;

    @Column(name = "end_date")
    LocalDate endDate;

    @Column(name = "due_date", nullable = false)
    LocalDate dueDate;

    @Column(name = "created_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime createdTime;

    @Column(name = "updated_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime updatedTime;
}
