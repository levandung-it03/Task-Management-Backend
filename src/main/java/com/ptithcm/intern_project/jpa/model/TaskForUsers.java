package com.ptithcm.intern_project.jpa.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
@Table(
    name = "task_for_users",
    uniqueConstraints = {@UniqueConstraint(columnNames = {"task_id", "assigned_to_id"})}
)
public class TaskForUsers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "assigned_to_id", referencedColumnName = "id", nullable = false)
    UserInfo assignedUser;

    @ManyToOne
    @JoinColumn(name = "task_id", referencedColumnName = "id", nullable = false)
    Task task;

    @Column(name = "user_task_status", nullable = false)
    @Enumerated(EnumType.STRING)
    UserTaskStatus userTaskStatus;

    @Column(name = "updated_time", nullable = false)
    LocalDateTime updatedTime = LocalDateTime.now();

    @OneToMany(mappedBy = "userTaskCreated", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
    @Builder.Default    //--Keep default value is our manually set value (or will be null)
    final List<Report> reports = new ArrayList<>();
}
