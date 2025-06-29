package com.ptithcm.intern_project.controllers;

import com.ptithcm.intern_project.common.wrappers.ApiResponseObject;
import com.ptithcm.intern_project.dataJpa.entities.UserInfo;
import com.ptithcm.intern_project.dto.request.DTO_UpdateUserInfo;
import com.ptithcm.intern_project.services.UserInfoService;
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
    public ResponseEntity<ApiResponseObject<UserInfo>> getUserInfo(@RequestHeader("Authorization") String token) {
        return ApiResponseObject.fromScs(GET_USER_INFO, userInfoService.getUserInfo(token));
    }

    @ResponseBody
    @PutMapping({"/user/user-info/v1/update-user-info", "/admin/user-info/v1/update-user-info"})
    public ResponseEntity<ApiResponseObject<Void>> updateUserInfo(
        @RequestHeader("Authorization") String token,
        @Valid @RequestBody DTO_UpdateUserInfo dto) {
        userInfoService.updateUserInfo(token, dto);
        return ApiResponseObject.fromScs(UPDATE_USER_INFO);
    }
}
