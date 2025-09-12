package com.ptithcm.intern_project.service.authzed;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

public interface AuthzedValue {

    @Getter
    @AllArgsConstructor
    @FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
    enum User {
        NAME("user"),
        ;
        String value;
    }

    @Getter
    @AllArgsConstructor
    @FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
    enum Project {
        NAME("project"),
        ROLE_OWNER("owner"),
        ROLE_MEMBER("member"),
        ;
        String value;
    }
}
