package com.ptithcm.intern_project.common.exception;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import lombok.Getter;

@Getter
public class AppExc extends RuntimeException {
    private final ErrorCodes errorEnum;

    public AppExc(ErrorCodes errorEnum) {
        super(errorEnum.toString());
        this.errorEnum = errorEnum;
    }
}
