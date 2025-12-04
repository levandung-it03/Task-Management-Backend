package com.ptithcm.intern_project.model.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RecommendingUsersResponse {
    @JsonProperty("top_ordered_users")
    List<RecUserInfoResponse> topOrderedUsers;
}
