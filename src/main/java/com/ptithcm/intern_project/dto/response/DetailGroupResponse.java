package com.ptithcm.intern_project.dto.response;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DetailGroupResponse {
    GroupResponse baseInfo;
    List<GroupUserResponse> groupHasUsers;
}
