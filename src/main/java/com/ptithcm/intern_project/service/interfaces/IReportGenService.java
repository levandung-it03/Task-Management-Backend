package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.request.ReportGenRequest;
import com.ptithcm.intern_project.model.dto.response.ReportGenResponse;

public interface IReportGenService {
    ReportGenResponse generateCompletedReport(ReportGenRequest request);
    ReportGenResponse generateProcessingReport(ReportGenRequest request);
    ReportGenResponse generateDailyReport(ReportGenRequest request, String token);
}
