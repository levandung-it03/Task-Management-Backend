```java
package com.ptithcm.intern_project.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DTO_Oauth2GoogleUserResponse {
    Object resourceName;
    Object etag;
    List<Map<String, Object>> names;
    List<Map<String, Object>> emailAddresses;
    List<Map<String, Object>> genders;
    List<Map<String, Object>> birthdays;
}
```