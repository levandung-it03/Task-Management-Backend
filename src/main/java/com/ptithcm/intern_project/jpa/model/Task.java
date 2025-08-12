package com.ptithcm.intern_project.jpa.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.jpa.model.enums.TaskLevel;
import com.ptithcm.intern_project.jpa.model.enums.TaskPriority;
import com.ptithcm.intern_project.jpa.model.enums.TaskType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.Check;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(
    name = "task",
    uniqueConstraints = {@UniqueConstraint(columnNames = {"collection_id", "name"})})
@Check(constraints = """
    updated_time >= created_time
    AND (end_date IS NULL OR end_date >= start_date)
    AND deadline >= start_date
""")
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "collection_id", referencedColumnName = "id", nullable = false)
    Collection collection;

    @ManyToOne
    @JoinColumn(name = "created_by_id", referencedColumnName = "id", nullable = false)
    UserInfo userInfoCreated;

    @ManyToOne
    @JoinColumn(name = "root_task_id", referencedColumnName = "id")
    Task rootTask;

    @Column(name = "name", nullable = false)
    String name;

    @Lob
    @Column(name = "description", nullable = false, columnDefinition = "TEXT")
    String description;

    @Lob
    @Column(name = "report_format", columnDefinition = "TEXT")
    String reportFormat;

    @Column(name = "level", nullable = false)
    @Enumerated(EnumType.STRING)
    TaskLevel level;

    @Column(name = "task_type", nullable = false)
    @Enumerated(EnumType.STRING)
    TaskType taskType;

    @Column(name = "priority", nullable = false)
    @Enumerated(EnumType.STRING)
    TaskPriority priority;

    @Column(name = "is_locked", nullable = false, columnDefinition = "BIT")
    boolean isLocked = true;

    @Column(name = "start_date", nullable = false)
    LocalDate startDate = LocalDate.now();

    @Column(name = "end_date")
    LocalDate endDate;

    @Column(name = "deadline", nullable = false)
    LocalDate deadline;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime = LocalDateTime.now();

    @Column(name = "updated_time", nullable = false)
    LocalDateTime updatedTime = LocalDateTime.now();

    @OneToMany(mappedBy = "task", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
    @Builder.Default    //--Keep default value is our manually set value (or will be null)
    final List<TaskForUsers> taskForUsers = new ArrayList<>();    //--OneToMany must receive a list, and init by ArrayList
}
