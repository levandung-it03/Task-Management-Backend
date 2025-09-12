package com.ptithcm.intern_project.model.dto.request;

import com.ptithcm.intern_project.config.annotation.constraint.OtpConstraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.validator.constraints.Length;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RegisterRequest {
    @NotNull
    @NotEmpty
    @Length(min = 6, max = 50)
    String username;

    @Email
    @NotNull
    @NotEmpty
    @Length(min = 6, max = 50)
    String email;

    @NotNull
    @NotEmpty
    @Length(min = 6, max = 20)
    String password;

    @NotNull
    @NotEmpty
    @Length(max = 200)
    @Pattern(regexp = "^[\\p{L} ]+$")
    String fullName;

    @NotNull
    @NotEmpty
    @Pattern(regexp = "^[0-9]{9,20}$")
    String identity;

    @NotNull
    @NotEmpty
    @Pattern(regexp = "^[0-9]{9,20}$")
    String phone;

    @NotNull
    Long departmentId;

    @NotNull
    @NotEmpty
    @OtpConstraint
    String otp;
}
