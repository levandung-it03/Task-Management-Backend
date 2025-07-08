package com.ptithcm.intern_project.dataJpa.entities;

import com.ptithcm.intern_project.dataJpa.entities.enums.TaskType;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
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
@Table(name = "task")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "task_list_id", referencedColumnName = "id", nullable = false)
    Collection collection;

    @ManyToOne
    @JoinColumn(name = "user_info_id", referencedColumnName = "id", nullable = false)
    UserInfo userInfo;

    @ManyToOne
    @JoinColumn(name = "root_task_id", referencedColumnName = "id")
    Task rootTask;

    @Column(name = "name", nullable = false)
    String name;

    @Column(name = "description", nullable = false)
    String description;

    @Column(name = "level", nullable = false, columnDefinition = "DEFAULT 1")
    @Min(1)
    @Max(3)
    int level;

    @Column(name = "task_type", nullable = false)
    @Enumerated(EnumType.STRING)
    TaskType taskType;

    @Column(name = "priority", nullable = false, columnDefinition = "DEFAULT 1")
    @Min(1)
    int priority;

    @Column(name = "start_date", nullable = false, columnDefinition = "DATE DEFAULT NOW()")
    LocalDate startDate;

    @Column(name = "end_date")
    LocalDate endDate;

    @Column(name = "deadline", nullable = false)
    LocalDate deadline;

    @Column(name = "created_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime createdTime;

    @Column(name = "updated_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime updatedTime;
}
