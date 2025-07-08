package com.ptithcm.intern_project.dataJpa.entities;

import com.ptithcm.intern_project.dataJpa.entities.enums.UserTaskStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "task_for_users")
public class TaskForUsers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_info_id", referencedColumnName = "id", nullable = false)
    UserInfo userInfo;

    @ManyToOne
    @JoinColumn(name = "task_id", referencedColumnName = "id", nullable = false)
    Task task;

    @Column(name = "user_task_status", nullable = false)
    @Enumerated(EnumType.STRING)
    UserTaskStatus userTaskStatus;

    @Column(name = "updated_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime updatedTime;
}
