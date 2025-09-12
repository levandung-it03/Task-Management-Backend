package com.ptithcm.intern_project.model.dto.response;

import com.ptithcm.intern_project.model.dto.general.EntityDelegatorDTO;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskDelegatorResponse {
    EntityDelegatorDTO taskInfo;
    EntityDelegatorDTO collectionInfo;
    EntityDelegatorDTO projectInfo;
    EntityDelegatorDTO phaseInfo;
}
