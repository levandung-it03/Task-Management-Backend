package com.ptithcm.intern_project.common.annotation.validators;

import com.ptithcm.intern_project.common.annotation.OtpConstraint;
import com.ptithcm.intern_project.service.OtpGenerator;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.Objects;

public class OtpValidator implements ConstraintValidator<OtpConstraint, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))    return true;
        if (value.isEmpty())    return true;
        return OtpGenerator.isValidOtp(value);
    }
}
