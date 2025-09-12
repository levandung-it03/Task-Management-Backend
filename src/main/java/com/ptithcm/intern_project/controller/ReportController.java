package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.model.dto.response.CommentResponse;
import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import com.ptithcm.intern_project.model.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.model.dto.request.ReportRejectedRequest;
import com.ptithcm.intern_project.model.dto.request.UpdatedReportRequest;
import com.ptithcm.intern_project.service.ReportService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
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
public class ReportController {
    ReportService reportService;

    @Operation(description = "Update Report by Report's owner")
    @PutMapping({
        ROLE_EMP + "/v1/report/{reportId}",
        ROLE_LEAD + "/v1/report/{reportId}",
        ROLE_PM + "/v1/report/{reportId}"})
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable("reportId") Long reportId,
        @Valid @RequestBody UpdatedReportRequest request,
        @RequestHeader("Authorization") String token) {
        reportService.update(reportId, request.getReport(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Create Comment of the Report (may be is replying another one)")
    @PostMapping({
        ROLE_EMP + "/v1/report/{reportId}/create-comment",
        ROLE_LEAD + "/v1/report/{reportId}/create-comment",
        ROLE_PM + "/v1/report/{reportId}/create-comment"})
    public ResponseEntity<RestApiResponse<CommentResponse>> createComment(
        @PathVariable("reportId") Long reportId,
        @Valid @RequestBody CommentCreationRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, reportService.createComment(reportId, request, token));
    }

    @Operation(description = "Approve specified Report by Task owner")
    @PutMapping({
        ROLE_PM + "/v1/report/{reportId}/approve-report",
        ROLE_LEAD + "/v1/report/{reportId}/approve-report"})
    public ResponseEntity<RestApiResponse<Void>> approveReport(
        @PathVariable("reportId") Long reportId,
        @RequestHeader("Authorization") String token) {
        reportService.approveReport(reportId, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Reject specified Report by Task owner")
    @PutMapping({
        ROLE_PM + "/v1/report/{reportId}/reject-report",
        ROLE_LEAD + "/v1/report/{reportId}/reject-report"})
    public ResponseEntity<RestApiResponse<Void>> rejectReport(
        @PathVariable("reportId") Long reportId,
        @Valid @RequestBody ReportRejectedRequest request,
        @RequestHeader("Authorization") String token) {
        reportService.rejectReport(reportId, request.getRejectedReason(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }
}
