package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.dto.request.ReportRejectedRequest;
import com.ptithcm.intern_project.dto.request.UpdatedReportRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.service.ReportService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;

@RestController
@RequestMapping("/api/v1/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportController {
    ReportService reportService;

    @Operation(description = "Update Report by Report's owner")
    @PutMapping({
        ROLE_EMP + "/report/{reportId}",
        ROLE_LEAD + "/report/{reportId}",
        ROLE_PM + "/report/{reportId}"})
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable("reportId") Long reportId,
        @Valid @RequestBody UpdatedReportRequest request,
        @RequestHeader("Authorization") String token) {
        reportService.update(reportId, request.getReport(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Create Comment of the Report (may be is replying another one)")
    @PostMapping({
        ROLE_EMP + "/report/{reportId}/create-comment",
        ROLE_LEAD + "/report/{reportId}/create-comment",
        ROLE_PM + "/report/{reportId}/create-comment"})
    public ResponseEntity<RestApiResponse<IdResponse>> createComment(
        @PathVariable("reportId") Long reportId,
        @Valid @RequestBody CommentCreationRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, reportService.createComment(reportId, request, token));
    }

    @Operation(description = "Approve specified Report by Task owner")
    @PutMapping({
        ROLE_EMP + "/report/{reportId}/approve-report",
        ROLE_LEAD + "/report/{reportId}/approve-report",
        ROLE_PM + "/report/{reportId}/approve-report"})
    public ResponseEntity<RestApiResponse<Void>> approveReport(
        @PathVariable("reportId") Long reportId,
        @RequestHeader("Authorization") String token) {
        reportService.approveReport(reportId, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Approve specified Report by Task owner")
    @PutMapping({
        ROLE_EMP + "/report/{reportId}/reject-report",
        ROLE_LEAD + "/report/{reportId}/reject-report",
        ROLE_PM + "/report/{reportId}/reject-report"})
    public ResponseEntity<RestApiResponse<Void>> rejectReport(
        @PathVariable("reportId") Long reportId,
        @Valid @RequestBody ReportRejectedRequest request,
        @RequestHeader("Authorization") String token) {
        reportService.rejectReport(reportId, request.getRejectedReason(), token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }
}
