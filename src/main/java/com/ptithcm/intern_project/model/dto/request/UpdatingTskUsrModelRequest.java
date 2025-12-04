package com.ptithcm.intern_project.model.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.ptithcm.intern_project.model.interf.TaskUserRecord;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UpdatingTskUsrModelRequest {
    @JsonProperty("new_records")
    List<TaskUserRecord> newRecords;
}
