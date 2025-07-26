package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.jpa.repository.ReportRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportService {
    ReportRepository reportRepository;

    public boolean hasAtLeastOneReport(Long taskId) {
        return reportRepository.existsByUserTaskCreatedTaskId(taskId);
    }
}
