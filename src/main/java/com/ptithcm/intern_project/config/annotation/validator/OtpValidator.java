package com.ptithcm.intern_project.config.annotation.validator;

import com.ptithcm.intern_project.config.annotation.constraint.OtpConstraint;
import com.ptithcm.intern_project.service.auth.OtpHelper;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.Objects;

public class OtpValidator implements ConstraintValidator<OtpConstraint, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))    return true;
        if (value.isEmpty())    return true;
        return OtpHelper.isValidOtp(value);
    }
}
