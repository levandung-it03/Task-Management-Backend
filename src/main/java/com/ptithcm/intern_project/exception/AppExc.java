package com.ptithcm.intern_project.exception;

import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import lombok.Getter;

@Getter
public class AppExc extends RuntimeException {
    private final ErrorCodes errorEnum;

    public AppExc(ErrorCodes errorEnum) {
        super(errorEnum.toString());
        this.errorEnum = errorEnum;
    }
}
