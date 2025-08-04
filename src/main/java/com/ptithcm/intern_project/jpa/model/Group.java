package com.ptithcm.intern_project.jpa.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
@Table(name = "`group`")
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "created_by_id", referencedColumnName = "id", nullable = false)
    UserInfo userInfoCreated;

    @Column(name = "name", nullable = false)
    String name;

    @Column(name = "active", nullable = false, columnDefinition = "BIT DEFAULT 1")
    boolean active;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime = LocalDateTime.now();

    @Column(name = "updated_time", nullable = false)
    LocalDateTime updatedTime = LocalDateTime.now();

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @JsonIgnore
    @Builder.Default    //--Keep default value is our manually set value (or will be null)
    List<GroupHasUsers> groupUsers = new ArrayList<>();    //--OneToMany must receive a list, and init by ArrayList
}
