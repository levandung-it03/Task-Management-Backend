package com.ptithcm.intern_project.model.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserPredScoreResponse {
    @JsonProperty("user_id")
    long userId;

    @JsonProperty("score")
    float score;
}
