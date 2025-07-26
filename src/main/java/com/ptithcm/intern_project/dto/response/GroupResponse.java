package com.ptithcm.intern_project.dto.response;

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
public class GroupResponse {
    Long id;
    ShortUserInfoDTO createdByUser;    //--Equivalent: `DTO_FastUserInfo`
    String name;
    boolean isActive;
    int userQuantity;
    LocalDateTime createdTime;
    LocalDateTime updatedTime;
}
