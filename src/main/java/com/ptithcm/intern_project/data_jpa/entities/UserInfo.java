package com.ptithcm.intern_project.data_jpa.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Objects;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "user_info")
public class UserInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long userInfoId;

    @Column(name = "full_name", nullable = false, length = 200)
    String fullName;

    @OneToOne(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", referencedColumnName = "account_id", nullable = false)
    @JsonIgnore
    Account account;

    @Column(name = "coins", nullable = false)
    Long coins;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "date_of_birth")
    LocalDate dob;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    Gender gender;

    public static enum Gender {
        MALE,
        FEMALE,
        ;
        public static boolean exists(String gender) {
            for (Gender g : Gender.values())
                if (g.toString().equalsIgnoreCase(gender))
                    return true;
            return false;
        }

        public static UserInfo.Gender customizedValueOf(Object gender) {
            if (Objects.isNull(gender)) return null;
            for (Gender g : Gender.values())
                if (g.toString().equalsIgnoreCase(gender.toString()))
                    return g;
            return null;
        }
    }

}
