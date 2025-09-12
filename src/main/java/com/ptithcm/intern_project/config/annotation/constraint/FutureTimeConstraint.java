package com.ptithcm.intern_project.config.annotation.constraint;

import com.ptithcm.intern_project.config.annotation.validator.FutureDateValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { FutureDateValidator.class })
public @interface FutureTimeConstraint {
    String message() default "Time must be in the future";
    Class<?>[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}
