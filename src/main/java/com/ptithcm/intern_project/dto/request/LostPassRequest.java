package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.annotation.constraint.OtpConstraint;
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
public class LostPassRequest {
    @NotNull
    @NotEmpty
    @Email
    String email;

    @NotNull
    @NotEmpty
    @OtpConstraint
    String otp;
}
