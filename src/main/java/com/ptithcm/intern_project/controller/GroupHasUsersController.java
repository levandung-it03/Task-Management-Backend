package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.request.ChangeGroupRoleRequest;
import com.ptithcm.intern_project.service.GroupHasUsersService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class GroupHasUsersController {
    GroupHasUsersService groupHasUsersService;

    @Operation(description = "Update Group-Role of joined User by Group-User-Id")
    @PutMapping({ROLE_PM + "/v1/group-user/{id}", ROLE_LEAD + "/v1/group-user/{id}"})
    public ResponseEntity<RestApiResponse<Void>> updateGroupRole(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody ChangeGroupRoleRequest request) {
        groupHasUsersService.updateGroupRole(id, request.getGroupRole(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Kick joined User by Group-User-Id")
    @PutMapping({ROLE_PM + "/v1/group-user/{id}/kick-user", ROLE_LEAD + "/v1/group-user/{id}/kick-user"})
    public ResponseEntity<RestApiResponse<Void>> kickUser(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        groupHasUsersService.kickUser(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Re-add User by Group-User-Id")
    @PutMapping({ROLE_PM + "/v1/group-user/{id}/re-add-user", ROLE_LEAD + "/v1/group-user/{id}/re-add-user"})
    public ResponseEntity<RestApiResponse<Void>> reAddUser(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        groupHasUsersService.reAddUser(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

}
