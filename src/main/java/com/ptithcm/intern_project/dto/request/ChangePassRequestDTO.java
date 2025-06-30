package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.common.annotations.OtpConstraint;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ChangePassRequestDTO {
    @NotNull
    @NotEmpty
    String password;

    @NotNull
    @NotEmpty
    @OtpConstraint
    String otp;
}
