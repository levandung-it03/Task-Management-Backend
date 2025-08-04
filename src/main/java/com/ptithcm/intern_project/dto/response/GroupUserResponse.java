package com.ptithcm.intern_project.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ptithcm.intern_project.jpa.model.enums.GroupRole;
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

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime involvedTime;

    boolean active;
}