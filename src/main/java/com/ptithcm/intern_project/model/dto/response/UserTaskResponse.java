package com.ptithcm.intern_project.model.dto.response;

import com.ptithcm.intern_project.model.enums.UserTaskStatus;
import lombok.*;
import lombok.experimental.FieldDefaults;

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
    int totalReports;

    public UserTaskResponse(Long id, String email, String fullName, String department, String role, UserTaskStatus userTaskStatus, Boolean wasDone) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.department = department;
        this.role = role;
        this.userTaskStatus = userTaskStatus;
        this.wasDone = wasDone;
    }
}
