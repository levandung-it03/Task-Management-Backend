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
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.config.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportGenController {
    ReportGenService reportGenService;

    @PostMapping({
        ROLE_PM + "/v1/report/completed-gen",
        ROLE_LEAD + "/v1/report/completed-gen",
        ROLE_EMP + "/v1/report/completed-gen"
    })
    public ResponseEntity<RestApiResponse<ReportGenResponse>> generateCompletedReport(@RequestBody ReportGenRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, reportGenService.generateCompletedReport(request));
    }

    @PostMapping({
            ROLE_PM + "/v1/report/processing-gen",
            ROLE_LEAD + "/v1/report/processing-gen",
            ROLE_EMP + "/v1/report/processing-gen"
    })
    public ResponseEntity<RestApiResponse<ReportGenResponse>> generateProcessingReport(@RequestBody ReportGenRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, reportGenService.generateProcessingReport(request));
    }


    @PostMapping({
            ROLE_PM + "/v1/report/daily-gen",
            ROLE_LEAD + "/v1/report/daily-gen"
    })
    public ResponseEntity<RestApiResponse<ReportGenResponse>> generateDailyReport(
            @RequestBody ReportGenRequest request,
            @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, reportGenService.generateDailyReport(request, token));
    }
}
