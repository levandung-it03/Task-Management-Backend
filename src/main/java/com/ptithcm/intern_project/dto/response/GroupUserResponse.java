package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.common.enums.GroupRole;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GroupUserResponse {
    Long id;
    GroupRole role;
    ShortUserInfoDTO joinedUser;
    LocalDateTime involvedTime;
}