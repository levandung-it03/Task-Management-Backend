package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.dto.response.ReportGenResponse;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import com.ptithcm.intern_project.model.dto.request.ReportGenRequest;
import com.ptithcm.intern_project.service.ReportGenService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.ptithcm.intern_project.config.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportGenController {
    ReportGenService reportGenService;

    @PostMapping({
        ROLE_PM + "/v1/report/generate",
        ROLE_LEAD + "/v1/report/generate",
        ROLE_EMP + "/v1/report/generate"
    })
    public ResponseEntity<RestApiResponse<ReportGenResponse>> generateReport(@RequestBody ReportGenRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, reportGenService.generateReport(request));
    }
}
