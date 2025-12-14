package com.ptithcm.intern_project.service.interf.interfaces;

import com.ptithcm.intern_project.model.dto.request.ReportGenClientRequest;
import com.ptithcm.intern_project.model.dto.response.ReportGenResponse;

public interface IInterfaceReportGenSvc {
    ReportGenResponse generateCompletedReport(ReportGenClientRequest request);
    ReportGenResponse generateProcessingReport(ReportGenClientRequest request);
    ReportGenResponse generateDailyReport(ReportGenClientRequest request);
}
