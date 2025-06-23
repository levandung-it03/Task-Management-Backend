package com.ptithcm.intern_project.controllers;

import com.ptithcm.intern_project.common.enums.Oauth2ServiceEnum;
import com.ptithcm.intern_project.common.enums.OtpTypes;
import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrappers.ApiResponseObject;
import com.ptithcm.intern_project.data_jpa.entities.UserInfo;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/api/public/enums")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class EnumsController {

    @ResponseBody
    @GetMapping("/v1/get-otp-enum-types")
    public ResponseEntity<ApiResponseObject<HashMap<String, String>>> getOtpEnumTypes() {
        var response = new HashMap<String, String>();
        for (OtpTypes e: OtpTypes.values())
            response.put(e.getName(), e.toString());
        return ApiResponseObject.fromScs(SuccessCodes.GET_ENUMS, response);
    }

    @ResponseBody
    @GetMapping("/v1/get-gender-enums")
    public ResponseEntity<ApiResponseObject<HashMap<String, String>>> getGenderEnums() {
        var response = new HashMap<String, String>();
        for (UserInfo.Gender g: UserInfo.Gender.values())
            response.put(g.toString().charAt(0) + g.toString().substring(1).toLowerCase(), g.toString());
        return ApiResponseObject.fromScs(SuccessCodes.GET_ENUMS, response);
    }

    @ResponseBody
    @GetMapping("/v1/get-oauth2-service-enums")
    public ResponseEntity<ApiResponseObject<HashMap<String, String>>> getOauth2ServiceEnums() {
        var response = new HashMap<String, String>();
        for (Oauth2ServiceEnum o: Oauth2ServiceEnum.values())
            response.put(o.toString().toLowerCase(), o.toString());
        return ApiResponseObject.fromScs(SuccessCodes.GET_ENUMS, response);
    }
}
