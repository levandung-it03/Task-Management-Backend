package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.request.ChangeGroupRoleRequest;
import com.ptithcm.intern_project.service.GroupHasUsersService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/v1/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class GroupHasUsersController {
    GroupHasUsersService groupHasUsersService;

    @PutMapping({ROLE_PM + "/group-user/{id}", ROLE_LEAD + "/group-user/{id}"})
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody ChangeGroupRoleRequest request) {
        groupHasUsersService.update(id, request.getGroupRole(), token);
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL);
    }

    @PutMapping({ROLE_PM + "/group-user/{id}/kick-user", ROLE_LEAD + "/group-user/{id}/kick-user"})
    public ResponseEntity<RestApiResponse<Void>> kickUser(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        groupHasUsersService.kickUser(id, token);
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL);
    }
}
