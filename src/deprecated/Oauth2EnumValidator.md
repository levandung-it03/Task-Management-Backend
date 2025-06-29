```java
package com.ptithcm.intern_project.common.annotations.validators;

import com.ptithcm.intern_project.common.annotations.Oauth2EnumConstraint;
import com.ptithcm.intern_project.common.enums.Oauth2ServiceEnum;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.util.Objects;

public class Oauth2EnumValidator implements ConstraintValidator<Oauth2EnumConstraint, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (Objects.isNull(value))  return true;
        if (value.isEmpty()) return true;
        return Oauth2ServiceEnum.exists(value);
    }
}

```