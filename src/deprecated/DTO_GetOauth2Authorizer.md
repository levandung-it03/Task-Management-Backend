```java
package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.common.annotation.Oauth2EnumConstraint;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DTO_GetOauth2Authorizer {
    @NotNull
    @NotEmpty
    @Oauth2EnumConstraint
    String oauth2Service;
}
```