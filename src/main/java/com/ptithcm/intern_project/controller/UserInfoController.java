package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.response.UserOverviewResponse;
import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.service.UserInfoService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ptithcm.intern_project.exception.enums.SuccessCodes.*;
import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserInfoController {
    UserInfoService userInfoService;

    @Operation(description = "Get User-Info by logging-in token")
    @GetMapping({
        ROLE_EMP + "/v1/user-info",
        ROLE_PM + "/v1/user-info",
        ROLE_LEAD + "/v1/user-info",
        ROLE_ADMIN + "/v1/user-info"})
    public ResponseEntity<RestApiResponse<UserInfo>> getUserInfo(@RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_USER_INFO, userInfoService.getUserInfo(token));
    }

    @Operation(description = "Update User-Info of logging-in token")
    @PutMapping({
        ROLE_EMP + "/v1/user-info",
        ROLE_PM + "/v1/user-info",
        ROLE_LEAD + "/v1/user-info",
        ROLE_ADMIN + "/v1/user-info"})
    public ResponseEntity<RestApiResponse<Void>> updateUserInfo(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody UpdatedUserInfoRequest dto) {
        userInfoService.updateUserInfo(token, dto);
        return RestApiResponse.fromScs(UPDATE_USER_INFO);
    }

    @Operation(description = "Searching Users by email, or full-name (used for Create-Group)")
    @GetMapping({
        ROLE_PM + "/v1/user-info/search/{query}",
        ROLE_LEAD + "/v1/user-info/search/{query}",
        ROLE_ADMIN + "/v1/user-info/search/{query}"})
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> fastSearchUsers(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token
    ) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, userInfoService.fastSearchUsers(query, token));
    }

    @Operation(description = "Search ALL Users by email, or full-name (used for Create-Task by PM)")
    @GetMapping(ROLE_PM + "/v1/user-info/search-for-new-task/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> pmFastSearchUsersForNewTask(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, userInfoService.fastSearchUsers(query, token));
    }

    @Operation(description = "Search LEAD, EMP Users by email, or full-name (used for Create-Task by LEAD)")
    @GetMapping(ROLE_LEAD + "/v1/user-info/search-for-new-task/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> leadFastSearchUsersForNewTask(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            userInfoService.leadFastSearchUsersForNewTask(query, token));
    }

    @Operation(description = "Search LEAD Users by email, or full-name (used for Create-Project by PM)")
    @GetMapping(ROLE_LEAD + "/v1/user-info/search-for-new-project/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> pmFastSearchUsersForNewProject(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            userInfoService.pmFastSearchUsersForNewProject(query, token));
    }

    @Operation(description = "Get public User-Info overview")
    @GetMapping({
        ROLE_EMP + "/v1/user-info/{email}",
        ROLE_PM + "/v1/user-info/{email}",
        ROLE_LEAD + "/v1/user-info/{email}",
        ROLE_ADMIN + "/v1/user-info/{email}"})
    public ResponseEntity<RestApiResponse<UserOverviewResponse>> getUserOverview(@PathVariable("email") String email) {
        return RestApiResponse.fromScs(GET_USER_INFO, userInfoService.getUserOverview(email));
    }
}
