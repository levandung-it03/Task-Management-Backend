package com.ptithcm.intern_project.jpa.model;

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
@Table(name = "comment_of_report")
public class CommentOfReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "created_by_id", referencedColumnName = "id", nullable = false)
    UserInfo userInfoCreated;

    @ManyToOne
    @JoinColumn(name = "report_id", referencedColumnName = "id", nullable = false)
    Report report;

    @ManyToOne
    @JoinColumn(name = "replied_comment_id", referencedColumnName = "id", nullable = false)
    CommentOfReport repliedComment;

    @Column(name = "comment", nullable = false)
    String comment;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime = LocalDateTime.now();

}