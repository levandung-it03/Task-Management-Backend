package com.ptithcm.intern_project.dto.general;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TokenInfoDTO {
    String jti;
    String token;
}