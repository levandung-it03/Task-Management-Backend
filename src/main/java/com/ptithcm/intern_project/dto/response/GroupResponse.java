package com.ptithcm.intern_project.dto.response;

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
    ShortUserInfoResponse createdByUser;
    String name;
    boolean isActive;
    LocalDateTime createdTime;
    LocalDateTime updatedTime;
    LocalDateTime userQuantity;
}
