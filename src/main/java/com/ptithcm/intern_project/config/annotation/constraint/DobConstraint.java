package com.ptithcm.intern_project.config.annotation.constraint;


import com.ptithcm.intern_project.config.annotation.validator.DobValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.ElementType.TYPE_USE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { DobValidator.class })
public @interface DobConstraint {
    String message() default "error in field 'dob'";
    Class<?>[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}
