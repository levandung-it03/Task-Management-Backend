package com.ptithcm.intern_project.config.annotation.validator;

import com.ptithcm.intern_project.config.annotation.constraint.FutureDateConstraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.time.LocalDate;

public class FutureDateValidator implements ConstraintValidator<FutureDateConstraint, LocalDate> {

    @Override
    public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
        if (value == null)  return true;
        return !value.isBefore(LocalDate.now());
    }
}
