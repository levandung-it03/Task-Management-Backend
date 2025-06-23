package com.ptithcm.intern_project.common.wrappers;

import com.ptithcm.intern_project.common.enums.TokenTypes;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Map;

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
