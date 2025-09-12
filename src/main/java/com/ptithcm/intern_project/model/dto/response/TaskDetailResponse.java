package com.ptithcm.intern_project.model.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ptithcm.intern_project.model.dto.general.EntityDelegatorDTO;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import com.ptithcm.intern_project.model.enums.Domain;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskDetailResponse {
    long id;
    ShortUserInfoDTO userInfoCreated;
    Long rootTaskId;
    String name;
    TaskLevel level;
    Domain taskType;
    TaskPriority priority;
    boolean isLocked;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate startDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate endDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    LocalDate deadline;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime createdTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime updatedTime;

    EntityDelegatorDTO taskInfo;
    EntityDelegatorDTO collectionInfo;
    EntityDelegatorDTO projectInfo;
    EntityDelegatorDTO phaseInfo;
}
