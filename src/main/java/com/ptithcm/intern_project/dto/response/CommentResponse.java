package com.ptithcm.intern_project.dto.response;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class CommentResponse {
    Long id;
    ShortUserInfoDTO createdBy;
    Long repliedCommendId;
    String comment;
    LocalDateTime createdTime;
}
