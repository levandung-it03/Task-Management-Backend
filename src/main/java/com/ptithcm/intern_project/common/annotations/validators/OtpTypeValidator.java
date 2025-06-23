package com.ptithcm.intern_project.common.annotations.validators;

import com.ptithcm.intern_project.common.annotations.OtpConstraint;
import com.ptithcm.intern_project.common.annotations.OtpTypeConstraint;
import com.ptithcm.intern_project.common.enums.OtpTypes;
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
