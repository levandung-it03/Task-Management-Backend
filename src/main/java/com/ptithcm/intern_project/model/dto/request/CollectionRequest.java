package com.ptithcm.intern_project.model.dto.request;

import com.ptithcm.intern_project.config.annotation.constraint.FutureDateConstraint;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CollectionRequest {

    @NotNull
    @NotEmpty
    String name;

    @NotNull
    @NotEmpty
    String description;

    @NotNull
    @FutureDateConstraint
    LocalDate startDate;

    @NotNull
    @FutureDateConstraint
    LocalDate dueDate;
}
