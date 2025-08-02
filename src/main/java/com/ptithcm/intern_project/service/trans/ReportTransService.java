package com.ptithcm.intern_project.service.trans;

import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Report;
import com.ptithcm.intern_project.jpa.repository.ReportRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportTransService {
    ReportRepository reportRepository;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Report findReviewableReport(Long reportId, String username) {
        var report = reportRepository.findById(reportId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isTaskOwner = report.getUserTaskCreated().getTask()
            .getUserInfoCreated()
            .getAccount().getUsername().equals(username);
        if (!isTaskOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        if (report.getReviewedTime() != null)
            throw new AppExc(ErrorCodes.REPORT_REVIEWED);

        return report;
    }
}
