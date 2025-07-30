package com.ptithcm.intern_project.dto.request;

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
public class PhaseRequest {

    @NotNull
    @NotEmpty
    String name;

    @NotNull
    @NotEmpty
    String description;

    @NotNull
    LocalDate startDate;

    @NotNull
    LocalDate dueDate;
}
