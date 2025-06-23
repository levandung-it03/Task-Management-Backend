package com.ptithcm.intern_project.common.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum TokenClaimNames {
    OWNER("OWNER"),
    SCOPES("SCOPES"),
    OAUTH2_REFRESH_TOKEN("OAUTH2_REFRESH_TOKEN"),
    TOKEN_TYPE("TOKEN_TYPE"),
    IS_OAUTH2("IS_OAUTH2"),
    ;
    String str;
    TokenClaimNames(String str) {
        this.str = str;
    }
}
