package com.ptithcm.intern_project.dataJpa.entities;

import com.ptithcm.intern_project.dataJpa.entities.enums.NoticedDetail;
import com.ptithcm.intern_project.dataJpa.entities.enums.NoticedEntity;
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
@Table(name = "notification")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "notieced_entity", nullable = false)
    @Enumerated(EnumType.STRING)
    NoticedEntity noticedEntity;

    @Column(name = "notieced_detail", nullable = false)
    @Enumerated(EnumType.STRING)
    NoticedDetail noticedDetail;

    @Column(name = "redirect_url_tail", nullable = false)
    String redirectUrlTail;

    @Column(name = "created_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime createdTime;

    public String getMessage() {
        StringBuilder result = new StringBuilder();
        switch (this.noticedDetail) {
            default:
                return result.toString();
        }
    }
}
