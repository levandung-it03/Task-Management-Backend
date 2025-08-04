package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.TaskCreationDTO;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.jpa.model.Task;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@AllArgsConstructor
public class TaskMapper {
    UserInfoMapper userInfoMapper;

    public Task newModel(TaskCreationDTO request) {
        return Task.builder()
            .collection(null)
            .userInfoCreated(request.getUserInfo())
            .rootTask(request.getRootTask())
            .name(request.getRequest().getName())
            .description(request.getRequest().getDescription())
            .reportFormat(request.getRequest().getReportFormat())
            .level(request.getRequest().getLevel())
            .taskType(request.getRequest().getTaskType())
            .priority(request.getRequest().getPriority())
            .isLocked(true) //--Locking a new Task (for any updating action)
            .startDate(request.getRequest().getStartDate())
            .endDate(null)
            .deadline(request.getRequest().getDeadline())
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
            .level(task.getLevel())
            .priority(task.getPriority())
            .startDate(task.getStartDate())
            .deadline(task.getDeadline())
            .taskType(task.getTaskType())
            .build();
    }

    public TaskResponse toResponse(Task foundTask, boolean hasAtLeastOneReport) {
        return TaskResponse.builder()
            .id(foundTask.getId())
            .userInfo(userInfoMapper.shortenUserInfo(foundTask.getUserInfoCreated()))
            .rootTaskId(foundTask.getRootTask() == null ? null : foundTask.getRootTask().getId())
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
