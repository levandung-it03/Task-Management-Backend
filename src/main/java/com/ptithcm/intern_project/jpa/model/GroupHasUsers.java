package com.ptithcm.intern_project.jpa.model;

import com.ptithcm.intern_project.common.enums.GroupRole;
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
@Table(name = "group_has_users")
public class GroupHasUsers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "joined_user_info_id", referencedColumnName = "id", nullable = false)
    UserInfo joinedUserInfo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "group_id", referencedColumnName = "id", nullable = false)
    Group group;

    @Column(name = "role", nullable = false)
    @Enumerated(EnumType.STRING)
    GroupRole role;

    @Column(name = "involved_time", nullable = false, columnDefinition = "DATETIME DEFAULT NOW()")
    LocalDateTime involvedTime;

    @Column(name = "active", columnDefinition = "BIT", nullable = false)
    boolean active;
}
