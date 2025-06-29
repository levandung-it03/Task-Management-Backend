package com.ptithcm.intern_project.controllers;

import com.ptithcm.intern_project.common.enums.OtpTypes;
import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrappers.ApiResponseObject;
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
}
