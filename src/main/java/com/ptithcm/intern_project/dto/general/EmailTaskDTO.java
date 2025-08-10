package com.ptithcm.intern_project.dto.general;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class EmailTaskDTO {
    String to;
    String subject;
    String body;
}
