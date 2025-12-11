package com.ptithcm.intern_project.model.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.model.enums.Domain;
import com.ptithcm.intern_project.model.enums.TaskLevel;
import com.ptithcm.intern_project.model.enums.TaskPriority;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Collection;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RecUsersRequest {

    @Min(1)
    int numOfEmp;

    @NotNull
    TaskLevel level;

    @NotNull
    TaskPriority priority;

    @NotNull
    Domain domain;

    @JsonIgnore
    Collection<Long> ignoredIds;//--AI won't use this

    @NotNull
    AuthorityEnum authority;    //--AI won't use this

    Long groupId;   //--AI won't use this
}
