package com.ptithcm.intern_project.jpa.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "project")
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "created_by_id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    UserInfo userInfoCreated;

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

    @Column(name = "active", columnDefinition = "BIT", nullable = false)
    boolean active = true;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime = LocalDateTime.now();

    @Column(name = "updated_time", nullable = false)
    LocalDateTime updatedTime = LocalDateTime.now();

    @OneToMany(mappedBy = "project", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
    @Builder.Default    //--Keep default value is our manually set value (or will be null)
    List<ProjectRole> projectUsers = new ArrayList<>();    //--OneToMany must receive a list, and init by ArrayList
}
