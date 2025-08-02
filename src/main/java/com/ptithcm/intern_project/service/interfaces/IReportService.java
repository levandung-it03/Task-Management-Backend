package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.request.CommentCreationRequest;
import com.ptithcm.intern_project.dto.request.ReportRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;

public interface IReportService {

    void update(Long reportId, String newContent, String token);

    IdResponse createComment(Long reportId, CommentCreationRequest request, String token);

    void approveReport(Long reportId, String token);

    void rejectReport(Long reportId, String rejectedReason, String token);
}
