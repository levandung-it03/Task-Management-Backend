package com.ptithcm.intern_project.dataJpa.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(
    name = "account",
    uniqueConstraints = {@UniqueConstraint(columnNames = {"username"})}
)
@Entity
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Account {
    private static final String SCOPES_DELIMITER = " "; //--static fields will not be included when there is a new instance.

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    Long accountId;

    @Column(name = "username", nullable = false)
    @Length(min = 6, max = 50)
    String username;

    @Column(name = "password", nullable = false)
    String password;

    @Column(name = "created_time", nullable = false)
    LocalDateTime createdTime;

    @Column(name = "active", columnDefinition = "BIT", nullable = false)
    boolean active;

    @ManyToMany(fetch = FetchType.EAGER, targetEntity = Authority.class)
    @JoinTable(
        name = "account_authorities",
        joinColumns = @JoinColumn(name = "account_id"),
        inverseJoinColumns = @JoinColumn(name = "authority_id")
    )
    @JsonIgnore
    Collection<Authority> authorities;

    public static String buildScope(Collection<Authority> authorities) {
        return String.join(
            Account.SCOPES_DELIMITER,
            authorities.stream().map(Authority::getAuthorityName).toList());
    }

    public static List<SimpleGrantedAuthority> extractAuthorities(String scopes) {
        return Arrays.stream(scopes.split(Account.SCOPES_DELIMITER))
            .filter(a -> !a.isEmpty())
            .map(SimpleGrantedAuthority::new)
            .collect(Collectors.toList());
    }
}
