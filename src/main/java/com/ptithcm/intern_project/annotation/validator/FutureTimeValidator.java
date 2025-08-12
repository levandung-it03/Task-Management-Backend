package com.ptithcm.intern_project.annotation.validator;

import com.ptithcm.intern_project.annotation.constraint.FutureTimeConstraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.time.LocalDateTime;

public class FutureTimeValidator implements ConstraintValidator<FutureTimeConstraint, LocalDateTime> {
    @Override
    public boolean isValid(LocalDateTime value, ConstraintValidatorContext context) {
        if (value == null)  return false;
        return !value.isBefore(LocalDateTime.now());
    }
}
