package com.ptithcm.intern_project.jpa.model;

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
@Table(name = "collection")
public class Collection {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "created_by_id", referencedColumnName = "id", nullable = false)
    UserInfo userInfoCreated;

    @ManyToOne
    @JoinColumn(name = "phase_id", referencedColumnName = "id", nullable = false)
    Phase phase;

    @Column(name = "name", nullable = false)
    String name;

    @Column(name = "description", nullable = false)
    String description;

    @Column(name = "start_date", nullable = false)
    LocalDate startDate = LocalDate.now();

    @Column(name = "end_date")
    LocalDate endDate;

    @Column(name = "due_date", nullable = false)
    LocalDate dueDate;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime = LocalDateTime.now();

    @Column(name = "updated_time", nullable = false)
    LocalDateTime updatedTime = LocalDateTime.now();
}
