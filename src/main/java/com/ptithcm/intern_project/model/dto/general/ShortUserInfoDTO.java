package com.ptithcm.intern_project.model.dto.general;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShortUserInfoDTO {
    String email;
    String fullName;
    String role;
    String department;
}
