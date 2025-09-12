package com.ptithcm.intern_project.model.dto.general;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserStatisticDTO {
    String email;
    String fullName;
    String role;
    String department;
    float approvedRatio;
    float totalPoint;
    int totalDoneTaskOnTime;
    int totalDoneTaskLate;
}
