package com.ptithcm.intern_project.model.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ptithcm.intern_project.model.enums.UserTaskStatus;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserTaskResponse {
    Long id;
    String email;
    String fullName;
    String department;
    String role;
    UserTaskStatus userTaskStatus;
    Boolean wasDone;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime startedTime;

    int totalReports;
}
