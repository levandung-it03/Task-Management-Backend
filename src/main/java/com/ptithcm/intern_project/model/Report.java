package com.ptithcm.intern_project.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.Check;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "report")
@Check(constraints = """
    updated_time >= created_time
    AND (reviewed_time IS NULL OR reviewed_time >= created_time)
""")
@FieldDefaults(level = AccessLevel.PRIVATE)
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
    @JsonIgnore
    @Builder.Default    //--Keep default value is our manually set value (or will be null)
    final List<CommentOfReport> commentOfReports = new ArrayList<>();    //--OneToMany must receive a list, and init by ArrayList
}
