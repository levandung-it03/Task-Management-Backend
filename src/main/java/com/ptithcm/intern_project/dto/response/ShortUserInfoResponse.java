package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShortUserInfoResponse {
    String email;
    String fullName;
    AuthorityEnum role;
}
