package com.ptithcm.intern_project.dto.general;

import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskCreationDTO {
    TaskRequest request;
    UserInfo userInfo;
    Task rootTask;
    Collection collectionOfTask;
}
