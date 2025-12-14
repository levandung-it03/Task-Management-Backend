package com.ptithcm.intern_project.service.interf;

import com.ptithcm.intern_project.client.FastAPIClient;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.dto.request.ReportGenClientRequest;
import com.ptithcm.intern_project.model.dto.response.ReportGenResponse;
import com.ptithcm.intern_project.service.interf.interfaces.IInterfaceReportGenSvc;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class InterfReportGenSvc implements IInterfaceReportGenSvc {
    private final FastAPIClient fastAPIClient;

    @Value("${env.fastapi.controllers.report-gen.generate-report}") String REPORT_GEN_PATH;

    @Override
    public ReportGenResponse generateCompletedReport(ReportGenClientRequest request) {
        try {
            return fastAPIClient.post(REPORT_GEN_PATH + "/completed-report", request, ReportGenResponse.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new AppExc(ErrorCodes.CANNOT_GENERATE_REPORT);
        }
    }

    @Override
    public ReportGenResponse generateProcessingReport(ReportGenClientRequest request) {
        try {
            return fastAPIClient.post(REPORT_GEN_PATH + "/processing-report", request, ReportGenResponse.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new AppExc(ErrorCodes.CANNOT_GENERATE_REPORT);
        }
    }

    @Override
    public ReportGenResponse generateDailyReport(ReportGenClientRequest request) {
        try {
            return fastAPIClient.post(REPORT_GEN_PATH + "/daily-report", request, ReportGenResponse.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new AppExc(ErrorCodes.CANNOT_GENERATE_REPORT);
        }
    }
}
