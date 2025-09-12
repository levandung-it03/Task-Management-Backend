package com.ptithcm.intern_project.model;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.GrantedAuthority;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(
    name = "authority",
    uniqueConstraints = {@UniqueConstraint(columnNames = {"name"})}
)
@Entity
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Authority implements GrantedAuthority {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "name", nullable = false)
    String name;

    @Override
    public String getAuthority() {
        return this.getName();
    }
}
