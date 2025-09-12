package com.ptithcm.intern_project.model.dto.general;

import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AccountCreationDTO {

    String username;
    String email;
    String password;
    String fullName;
    String identity;
    String phone;
    AuthorityEnum authority;
    Long departmentId;
    Long expertiseId;
}
