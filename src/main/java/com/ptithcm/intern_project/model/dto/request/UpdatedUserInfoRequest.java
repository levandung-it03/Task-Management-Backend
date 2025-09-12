package com.ptithcm.intern_project.model.dto.request;

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
public class UpdatedUserInfoRequest {

    @NotNull
    @NotEmpty
    @Length(max = 200)
    String fullName;

    @NotNull
    @NotEmpty
    @Pattern(regexp = "\\d+")
    String identity;

    @NotNull
    @NotEmpty
    @Pattern(regexp = "\\d+")
    String phone;
}
