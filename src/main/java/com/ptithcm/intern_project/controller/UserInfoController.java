package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.service.UserInfoService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.common.enums.SuccessCodes.GET_USER_INFO;
import static com.ptithcm.intern_project.common.enums.SuccessCodes.UPDATE_USER_INFO;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserInfoController {
    UserInfoService userInfoService;

    @ResponseBody
    @GetMapping({"/user/user-info/v1/get-user-info", "/admin/user-info/v1/get-user-info"})
    public ResponseEntity<RestApiResponse<UserInfo>> getUserInfo(@RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(GET_USER_INFO, userInfoService.getUserInfo(token));
    }

    @ResponseBody
    @PutMapping({"/user/user-info/v1/update-user-info", "/admin/user-info/v1/update-user-info"})
    public ResponseEntity<RestApiResponse<Void>> updateUserInfo(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody UpdatedUserInfoRequest dto) {
        userInfoService.updateUserInfo(token, dto);
        return RestApiResponse.fromScs(UPDATE_USER_INFO);
    }
}
