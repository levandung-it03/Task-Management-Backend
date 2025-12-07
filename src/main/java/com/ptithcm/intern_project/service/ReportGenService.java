package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.dto.request.ReportGenClientRequest;
import com.ptithcm.intern_project.model.dto.request.ReportGenRequest;
import com.ptithcm.intern_project.model.dto.response.ReportGenResponse;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import com.ptithcm.intern_project.service.interf.InterfReportGenSvc;
import com.ptithcm.intern_project.service.interfaces.IReportGenService;
import com.ptithcm.intern_project.util.DateTimeUtil;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportGenService implements IReportGenService {
    InterfReportGenSvc interfSvc;
    TaskForUsersService taskForUsersService;
    ReportService reportService;

    @Override
    public ReportGenResponse generateReport(ReportGenRequest request) {
        TaskForUsers userTask = taskForUsersService
            .findById(request.getTaskUserId())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var task = userTask.getTask();
        var collection = task.getCollection();
        var phase = collection.getPhase();
        var user = userTask.getAssignedUser();
        var reports = reportService.findAllByUserTaskCreatedId(request.getTaskUserId())
            .stream()
            .filter(report -> report.getReportStatus().equals(ReportStatus.REJECTED))
            .sorted((r1, r2) -> {
                long timeR1 = DateTimeUtil.timeToMilli(r1.getCreatedTime());
                long timeR2 = DateTimeUtil.timeToMilli(r2.getCreatedTime());
                return Math.toIntExact(timeR1 - timeR2);
            })
            .toList();

        var clientRequest = ReportGenClientRequest.builder()
            .task(task.getName())
            .taskDesc(task.getDescription())
            .collectionName(collection.getName())
            .collectionDesc(collection.getDescription())
            .phaseName(phase.getName())
            .phaseDesc(phase.getDescription())
            .projectName(phase.getProject().getName())
            .projectDesc(phase.getProject().getDescription())
            .rejectCount(reports.stream()
                .filter(report -> report.getReportStatus().equals(ReportStatus.REJECTED))
                .count())
            .rejectedReason(reports.isEmpty() ? "" : reports.getLast().getRejectedReason())
            .employeeName(user.getFullName())
            .build();
        return interfSvc.generateReport(clientRequest);
    }

}
