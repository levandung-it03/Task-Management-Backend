package com.ptithcm.intern_project.common.wrapper;

import com.ptithcm.intern_project.common.enums.TokenTypes;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GeneralTokenClaims {
    String subject;
    String owner;
    String scopes;
    Boolean isOauth2;
    TokenTypes typeEnum;
}
