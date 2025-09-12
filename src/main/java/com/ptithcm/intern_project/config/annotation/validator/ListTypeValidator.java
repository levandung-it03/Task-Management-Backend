package com.ptithcm.intern_project.config.annotation.validator;

import com.ptithcm.intern_project.config.annotation.constraint.ListTypeConstraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.List;

public class ListTypeValidator implements ConstraintValidator<ListTypeConstraint, List<?>> {
    Class<?> type;

    @Override
    public void initialize(ListTypeConstraint constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
        this.type = constraintAnnotation.type();
    }

    @Override
    public boolean isValid(List<?> values, ConstraintValidatorContext context) {
        if (values == null) return true;
        if (values.isEmpty()) return true;
        return values.stream().allMatch(value -> type.isInstance(value));
    }
}
