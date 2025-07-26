package com.ptithcm.intern_project.common.mapper;

import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@NoArgsConstructor
public class TaskMapper {

    public Task newModel(TaskRequest request, UserInfo userInfo, Task rootTask) {
        return Task.builder()
            .userInfoCreated(userInfo)
            .rootTask(rootTask)
            .name(request.getName())
            .description(request.getDescription())
            .reportFormat(request.getReportFormat())
            .level(request.getLevel())
            .taskType(request.getTaskType())
            .priority(request.getPriority())
            .isLocked(true) //--Locking a new Task (for any updating action)
            .startDate(request.getStartDate())
            .endDate(null)
            .deadline(request.getDeadline())
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .build();
    }

    public void mappingBaseInfo(Task updatedTask, UpdatedTaskRequest request) {
        updatedTask.setLevel(request.getLevel());
        updatedTask.setTaskType(request.getTaskType());
        updatedTask.setPriority(request.getPriority());
        updatedTask.setUpdatedTime(LocalDateTime.now());
    }

    public ShortTaskResponse shortenTaskResponse(Task task) {
        return ShortTaskResponse.builder()
            .id(task.getId())
            .name(task.getName())
            .taskPriority(task.getPriority())
            .startDate(task.getStartDate())
            .deadline(task.getDeadline())
            .taskType(task.getTaskType())
            .build();
    }

    public TaskResponse toResponse(Task foundTask, boolean hasAtLeastOneReport) {
        return TaskResponse.builder()
            .userInfo(foundTask.getUserInfoCreated())
            .rootTask(foundTask.getRootTask())
            .name(foundTask.getName())
            .description(foundTask.getDescription())
            .reportFormat(foundTask.getReportFormat())
            .level(foundTask.getLevel())
            .taskType(foundTask.getTaskType())
            .priority(foundTask.getPriority())
            .isLocked(true) //--Locking a new Task (for any updating action)
            .startDate(foundTask.getStartDate())
            .endDate(null)
            .deadline(foundTask.getDeadline())
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .hasAtLeastOneReport(hasAtLeastOneReport)
            .build();
    }
}
