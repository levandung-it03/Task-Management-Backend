package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.dto.request.ReportGenClientRequest;
import com.ptithcm.intern_project.model.dto.request.ReportGenRequest;
import com.ptithcm.intern_project.model.dto.request.ReportGenSubtaskRequest;
import com.ptithcm.intern_project.model.dto.response.ReportGenResponse;
import com.ptithcm.intern_project.model.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.model.dto.response.TaskResponse;
import com.ptithcm.intern_project.model.enums.ReportStatus;
import com.ptithcm.intern_project.service.interf.InterfReportGenSvc;
import com.ptithcm.intern_project.service.interfaces.IReportGenService;
import com.ptithcm.intern_project.util.DateTimeUtil;
import jxl.write.DateTime;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ReportGenService implements IReportGenService {
    InterfReportGenSvc interfSvc;
    TaskForUsersService taskForUsersService;
    TaskService taskService;
    ReportService reportService;

    @Override
    public ReportGenResponse generateCompletedReport(ReportGenRequest request) {
        TaskForUsers userTask = taskForUsersService
            .findById(request.getTaskUserId())
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        Task task = userTask.getTask();
        Task subtask = new Task();

        if (task.getRootTask() != null) {
            subtask = task;
            task = subtask.getRootTask();
        }

        var collection = task.getCollection();
        var phase = collection.getPhase();
        var user = userTask.getAssignedUser();
//        var reports = reportService.findAllByUserTaskCreatedId(request.getTaskUserId())
//            .stream()
//            .filter(report -> report.getReportStatus().equals(ReportStatus.REJECTED))
//            .sorted((r1, r2) -> {
//                long timeR1 = DateTimeUtil.timeToMilli(r1.getCreatedTime());
//                long timeR2 = DateTimeUtil.timeToMilli(r2.getCreatedTime());
//                return Math.toIntExact(timeR1 - timeR2);
//            })
//            .toList();


        var clientRequest = ReportGenClientRequest.builder()
            .subtaskName(subtask.getName())
            .subtaskDesc(subtask.getDescription())
            .task(task.getName())
            .taskDesc(task.getDescription())
            .creatorName(task.getUserInfoCreated().getFullName())
            .collectionName(collection.getName())
            .collectionDesc(collection.getDescription())
            .phaseName(phase.getName())
            .phaseDesc(phase.getDescription())
            .projectName(phase.getProject().getName())
            .projectDesc(phase.getProject().getDescription())
//            .rejectCount(reports.stream()
//                .filter(report -> report.getReportStatus().equals(ReportStatus.REJECTED))
//                .count())
//            .rejectedReason(reports.isEmpty() ? "" : reports.getLast().getRejectedReason())
            .employeeName(user.getFullName())
            .build();
        return interfSvc.generateCompletedReport(clientRequest);
    }

    @Override
    public ReportGenResponse generateProcessingReport(ReportGenRequest request) {
        TaskForUsers userTask = taskForUsersService
                .findById(request.getTaskUserId())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        Task task = userTask.getTask();
        Task subtask = new Task();

        if (task.getRootTask() != null) {
            subtask = task;
            task = subtask.getRootTask();
        }

        var collection = task.getCollection();
        var phase = collection.getPhase();
        var user = userTask.getAssignedUser();
//        var reports = reportService.findAllByUserTaskCreatedId(request.getTaskUserId())
//            .stream()
//            .filter(report -> report.getReportStatus().equals(ReportStatus.REJECTED))
//            .sorted((r1, r2) -> {
//                long timeR1 = DateTimeUtil.timeToMilli(r1.getCreatedTime());
//                long timeR2 = DateTimeUtil.timeToMilli(r2.getCreatedTime());
//                return Math.toIntExact(timeR1 - timeR2);
//            })
//            .toList();


        var clientRequest = ReportGenClientRequest.builder()
            .subtaskName(subtask.getName())
            .subtaskDesc(subtask.getDescription())
            .task(task.getName())
            .taskDesc(task.getDescription())
            .creatorName(task.getUserInfoCreated().getFullName())
            .collectionName(collection.getName())
            .collectionDesc(collection.getDescription())
            .phaseName(phase.getName())
            .phaseDesc(phase.getDescription())
            .projectName(phase.getProject().getName())
            .projectDesc(phase.getProject().getDescription())
//            .rejectCount(reports.stream()
//                .filter(report -> report.getReportStatus().equals(ReportStatus.REJECTED))
//                .count())
//            .rejectedReason(reports.isEmpty() ? "" : reports.getLast().getRejectedReason())
            .employeeName(user.getFullName())
            .build();
        return interfSvc.generateProcessingReport(clientRequest);
    }

    @Override
    public ReportGenResponse generateDailyReport(ReportGenRequest request, String token) {
        TaskForUsers userTask = taskForUsersService
                .findById(request.getTaskUserId())
                .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var task = userTask.getTask();
        var collection = task.getCollection();
        var phase = collection.getPhase();

        List<ShortTaskResponse> shortTask = taskService.getSubTasksOfRootTask(task.getId(), token);
        List<ReportGenSubtaskRequest> subtasks = new ArrayList<>();

        if (shortTask != null && !shortTask.isEmpty()) {
            for (ShortTaskResponse shortTaskResponse : shortTask) {
                TaskResponse tempTask = taskService.get(shortTaskResponse.getId(), token);
                String status;

                if (tempTask.isLocked()) {
                    status = "blocked";
                }
                else if (LocalDate.now().isBefore(tempTask.getStartDate())) {
                    status = "not_started";
                } else {
                    List<TaskForUsers> taskForUsers = Optional.ofNullable(taskForUsersService
                                    .getAllUsersOfTask(tempTask.getId()))
                            .orElse(Collections.emptyList());

                    long approvedCount = 0;

                    for (TaskForUsers taskForUser: taskForUsers) {
                                approvedCount += reportService.findAllByUserTaskCreatedId(taskForUser.getId())
                                .stream()
                                .filter(report -> report.getReportStatus().equals(ReportStatus.APPROVED)).count();
                    }

                    if (approvedCount == 1) {
                        status = "completed";
                    }
                    else {
                        status = "in_progress";
                    }
                }
                subtasks.add(ReportGenSubtaskRequest.builder().name(tempTask.getName()).status(status).build());
            }
        }

        var clientRequest = ReportGenClientRequest.builder()
                .task(task.getName())
                .taskDesc(task.getDescription())
                .collectionName(collection.getName())
                .collectionDesc(collection.getDescription())
                .phaseName(phase.getName())
                .phaseDesc(phase.getDescription())
                .projectName(phase.getProject().getName())
                .projectDesc(phase.getProject().getDescription())
                .subtasks(subtasks)
                .build();
        return interfSvc.generateDailyReport(clientRequest);
    }

}
