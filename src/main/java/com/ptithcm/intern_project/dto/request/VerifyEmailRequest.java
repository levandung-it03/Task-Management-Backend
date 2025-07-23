package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.common.annotation.constraint.OtpTypeConstraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class VerifyEmailRequest {
    @Email
    @NotNull
    @NotEmpty
    String email;

    @NotNull
    @NotEmpty
    @OtpTypeConstraint
    String otpType;
}
