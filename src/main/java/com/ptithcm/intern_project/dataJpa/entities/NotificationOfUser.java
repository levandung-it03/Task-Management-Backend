package com.ptithcm.intern_project.dataJpa.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "notification_of_user")
public class NotificationOfUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "user_info_id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    UserInfo userInfo;

    @ManyToOne
    @JoinColumn(name = "notification_id", referencedColumnName = "id", nullable = false)
    Notification notification;

    @Column(name = "is_read", nullable = false, columnDefinition = "BIT DEFAULT 0")
    boolean isRead;
}
