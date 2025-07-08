package com.ptithcm.intern_project.dataJpa.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.dataJpa.entities.enums.ReportStatus;
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
@Table(name = "report")
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_task_id", referencedColumnName = "id", nullable = false)
    TaskForUsers userTask;

    @Lob
    @Column(name = "content", nullable = false)
    String content;

    @Column(name = "rejected_reason")
    String rejectedReason;

    @Column(name = "report_status")
    @Enumerated(EnumType.STRING)
    ReportStatus reportStatus;

    @Column(name = "reviewed_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime reviewedTime;

    @Column(name = "created_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime createdTime;

    @Column(name = "updated_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime updatedTime;
}
