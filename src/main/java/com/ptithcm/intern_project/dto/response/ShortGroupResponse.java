package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.jpa.model.enums.GroupRole;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShortGroupResponse {
    Long id;
    String name;
    GroupRole role;
}
