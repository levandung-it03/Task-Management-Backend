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
@FieldDefaults(level = AccessLevel.PRIVATE)
public class AddedLeaderRequest {

    @NotNull
    @NotEmpty
    @ListTypeConstraint(type = String.class)
    List<String> assignedEmails;
}
