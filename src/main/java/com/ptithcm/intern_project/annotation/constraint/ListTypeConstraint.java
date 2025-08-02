package com.ptithcm.intern_project.annotation.constraint;

import com.ptithcm.intern_project.annotation.validator.ListTypeValidator;
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
@Constraint(validatedBy = { ListTypeValidator.class })
public @interface ListTypeConstraint {
    String message() default "invalid types on list data";
    Class<?>[] groups() default { };
    Class<? extends Payload>[] payload() default { };
    Class<?> type() default Object.class;
}
