```java
package com.ptithcm.intern_project.common.annotations;

import com.ptithcm.intern_project.common.annotations.validators.GenderValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.ElementType.TYPE_USE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = { GenderValidator.class })
public @interface GenderConstraint {
    String message() default "error in field 'gender'";
    Class<?>[] groups() default { };
    Class<? extends Payload>[] payload() default { };
}

```