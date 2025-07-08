package com.ptithcm.intern_project.dataJpa.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "user_info")
public class UserInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "full_name", nullable = false, length = 200)
    String fullName;

    @Column(name = "email", nullable = false, unique = true)
    String email;

    @Column(name = "phone")
    String phone;

    @ManyToOne
    @JoinColumn(name = "department_id", referencedColumnName = "id", nullable = false)
    Department department;

    @OneToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    Account account;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "date_of_birth")
    LocalDate dob;

}
