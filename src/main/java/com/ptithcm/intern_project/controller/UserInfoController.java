package com.ptithcm.intern_project.controller;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
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

import static com.ptithcm.intern_project.common.enums.SuccessCodes.GET_USER_INFO;
import static com.ptithcm.intern_project.common.enums.SuccessCodes.UPDATE_USER_INFO;

@RestController
@RequestMapping("/api/v1/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserInfoController {
    UserInfoService userInfoService;

    @Operation(description = "Get User-Info by logging-in token")
    @GetMapping({
        ROLE_EMP + "/user-info",
        ROLE_PM + "/user-info",
        ROLE_LEAD + "/user-info",
        ROLE_ADMIN + "/user-info"})
    public ResponseEntity<RestApiResponse<UserInfo>> getUserInfo(@RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_USER_INFO, userInfoService.getUserInfo(token));
    }

    @Operation(description = "Update User-Info of logging-in token")
    @PutMapping({
        ROLE_EMP + "/user-info",
        ROLE_PM + "/user-info",
        ROLE_LEAD + "/user-info",
        ROLE_ADMIN + "/user-info"})
    public ResponseEntity<RestApiResponse<Void>> updateUserInfo(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody UpdatedUserInfoRequest dto) {
        userInfoService.updateUserInfo(token, dto);
        return RestApiResponse.fromScs(UPDATE_USER_INFO);
    }

    @Operation(description = "Searching Users by email, or full-name (used for Create-Group)")
    @GetMapping({
        ROLE_PM + "/user-info/search/{query}",
        ROLE_LEAD + "/user-info/search/{query}",
        ROLE_ADMIN + "/user-info/search/{query}"})
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> fastSearchUsers(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token
    ) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, userInfoService.fastSearchUsers(query, token));
    }

    @Operation(description = "Search ALL Users by email, or full-name (used for Create-Task by PM)")
    @GetMapping(ROLE_PM + "/user-info/search-for-new-task/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> pmFastSearchUsersForNewTask(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token
    ) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, userInfoService.fastSearchUsers(query, token));
    }

    @Operation(description = "Search LEAD, EMP Users by email, or full-name (used for Create-Task by LEAD)")
    @GetMapping(ROLE_LEAD + "/user-info/search-for-new-task/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> leadFastSearchUsersForNewTask(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token
    ) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            userInfoService.leadFastSearchUsersForNewTask(query, token));
    }

    @Operation(description = "Search LEAD Users by email, or full-name (used for Create-Project by PM)")
    @GetMapping(ROLE_LEAD + "/user-info/search-for-new-project/{query}")
    public ResponseEntity<RestApiResponse<List<ShortUserInfoDTO>>> pmFastSearchUsersForNewProject(
        @PathVariable("query") String query,
        @RequestHeader("Authorization") String token
    ) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            userInfoService.pmFastSearchUsersForNewProject(query, token));
    }

}
