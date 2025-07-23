package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.common.enums.GroupRole;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ChangeGroupRoleRequest {
    @NotNull
    GroupRole groupRole;
}
