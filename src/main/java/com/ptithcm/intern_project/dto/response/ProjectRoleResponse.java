package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.jpa.model.enums.RoleOnEntity;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProjectRoleResponse {
    String fullName;
    String email;
    String role;
    RoleOnEntity projectRole;
}
