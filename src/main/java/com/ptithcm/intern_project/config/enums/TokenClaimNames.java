
package com.ptithcm.intern_project.config.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum TokenClaimNames {
    OWNER("OWNER"),
    SCOPES("SCOPES"),
    TOKEN_TYPE("TOKEN_TYPE"),
    IS_OAUTH2("IS_OAUTH2"),
    ;
    String str;
    TokenClaimNames(String str) {
        this.str = str;
    }
}