package com.ptithcm.intern_project.model.interf;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.ptithcm.intern_project.model.enums.Domain;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(
    name = "interf_task_user",
    indexes = { @Index(name = "record_sts_index", columnList = "was_sent") }
)
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskUserRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "record_id")
    @JsonIgnore
    Long recordId;

    @Column(name = "user_id", nullable = false)
    @JsonProperty("user_id")
    Long userId;

    @JsonProperty("domain")
    @Enumerated(EnumType.STRING)
    Domain domain;

    @JsonProperty("level")
    @Enumerated(EnumType.STRING)
    TaskLevel level;

    @JsonProperty("priority")
    @Enumerated(EnumType.STRING)
    TaskPriority priority;

    @Column(name = "is_on_time", nullable = false)
    @Min(0)
    @Max(1)
    @JsonProperty("is_on_time")
    int isOnTime;

    @Column(name = "free_time_rto")
    @Min(0)
    @Max(1)
    @JsonProperty("free_time_rto")
    float freeTimeRto;

    @Column(name = "punct_score")
    @Min(0)
    @Max(1)
    @JsonProperty("punct_score")
    float punctScore;

    @Column(name = "was_sent", nullable = false, columnDefinition = "BIT")
    @Builder.Default
    @JsonProperty("was_sent")
    boolean wasSent = false;
}
