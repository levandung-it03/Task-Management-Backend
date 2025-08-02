package com.ptithcm.intern_project.annotation.validator;

import com.ptithcm.intern_project.annotation.constraint.OtpTypeConstraint;
import com.ptithcm.intern_project.redis.model.enums.OtpTypes;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.Objects;

public class OtpTypeValidator implements ConstraintValidator<OtpTypeConstraint, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))  return true;
        if (value.isEmpty()) return true;
        return OtpTypes.exists(value);
    }
}
