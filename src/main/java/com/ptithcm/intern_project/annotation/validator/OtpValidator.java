package com.ptithcm.intern_project.annotation.validator;

import com.ptithcm.intern_project.annotation.constraint.OtpConstraint;
import com.ptithcm.intern_project.security.service.OtpService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.Objects;

public class OtpValidator implements ConstraintValidator<OtpConstraint, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))    return true;
        if (value.isEmpty())    return true;
        return OtpService.isValidOtp(value);
    }
}
