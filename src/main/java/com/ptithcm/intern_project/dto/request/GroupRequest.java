package com.ptithcm.intern_project.dto.request;

import com.ptithcm.intern_project.common.annotation.constraint.ListTypeConstraint;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GroupRequest {
    @NotEmpty
    @NotNull
    String name;

    @NotEmpty
    @NotNull
    @ListTypeConstraint(type = String.class)
    List<String> assignedEmails;
}
