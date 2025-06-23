package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.common.annotations.DobConstraint;
import com.ptithcm.intern_project.common.annotations.GenderConstraint;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DTO_UpdateUserInfo {

    @NotNull
    @NotEmpty
    @Length(max = 200)
    @Pattern(regexp = "^[\\p{L} ]+$")
    String fullName;

    @NotNull
    @DobConstraint
    LocalDate dob;

    @NotNull
    @NotEmpty
    @GenderConstraint
    String gender;
}
