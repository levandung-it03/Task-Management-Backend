package com.ptithcm.intern_project.jpa.model;

import com.ptithcm.intern_project.jpa.model.enums.ReportStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;
import java.util.ArrayList;

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
    @JoinColumn(name = "created_by_id", referencedColumnName = "id", nullable = false)
    TaskForUsers userTaskCreated;

    @Column(name = "title", nullable = false)
    String title;

    @Lob
    @Column(name = "content", nullable = false)
    String content;

    @Column(name = "rejected_reason")
    String rejectedReason = null;

    @Column(name = "report_status", nullable = false)
    @Enumerated(EnumType.STRING)
    ReportStatus reportStatus = ReportStatus.WAITING;

    @Column(name = "reviewed_time")
    LocalDateTime reviewedTime = null;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime = LocalDateTime.now();

    @Column(name = "updated_time", nullable = false)
    LocalDateTime updatedTime = LocalDateTime.now();

    @OneToMany(mappedBy = "report", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    ArrayList<CommentOfReport> commentOfReports = new ArrayList<>();
}
