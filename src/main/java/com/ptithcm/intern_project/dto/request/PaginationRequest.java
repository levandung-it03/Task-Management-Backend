package com.ptithcm.intern_project.dto.request;

import jakarta.validation.constraints.Min;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PaginatedSearchRequest <T> {
    String searchVal;
    String filterField;
    String sortedField;
    int sortedMode;
    @Min(1)
    int page;
    T data;
}
