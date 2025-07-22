package com.ptithcm.intern_project.dto.request;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.validator.constraints.Length;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AuthRequest {
    @NotNull
    @NotEmpty
    @Length(min = 6, max = 50)
    String username;

    @NotNull
    @NotEmpty
    @Length(min = 6, max = 20)
    String password;
}
