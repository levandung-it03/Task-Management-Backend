package com.ptithcm.intern_project.annotation.validator;

import com.ptithcm.intern_project.annotation.constraint.DobConstraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Value;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Objects;

public class DobValidator implements ConstraintValidator<DobConstraint, LocalDate> {
    @Value("${env.variables.min-age}")
    private int minAge;

    @Override
    public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))  return true;
        return value.isBefore(LocalDate.now()) && ChronoUnit.YEARS.between(value, LocalDate.now()) >= minAge;
    }
}
