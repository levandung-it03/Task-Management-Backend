```java
package com.ptithcm.intern_project.common.annotation.validators;

import com.ptithcm.intern_project.common.annotation.GenderConstraint;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class GenderValidator implements ConstraintValidator<GenderConstraint, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null) return true;
        if (value.isEmpty()) return true;
        return UserInfo.Gender.exists(value);
    }
}

```