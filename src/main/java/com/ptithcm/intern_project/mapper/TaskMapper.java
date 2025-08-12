package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.EntityDelegatorDTO;
import com.ptithcm.intern_project.dto.general.TaskCreationDTO;
import com.ptithcm.intern_project.dto.request.UpdatedTaskRequest;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.dto.response.TaskDelegatorResponse;
import com.ptithcm.intern_project.dto.response.TaskDetailResponse;
import com.ptithcm.intern_project.dto.response.TaskResponse;
import com.ptithcm.intern_project.jpa.model.Task;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@AllArgsConstructor
public class TaskMapper {
    UserInfoMapper userInfoMapper;

    public Task newModel(TaskCreationDTO request) {
        return Task.builder()
            .collection(request.getCollectionOfTask())
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
            .isLocked(foundTask.isLocked())
            .startDate(foundTask.getStartDate())
            .endDate(foundTask.getEndDate())
            .deadline(foundTask.getDeadline())
            .createdTime(foundTask.getCreatedTime())
            .updatedTime(foundTask.getUpdatedTime())
            .hasAtLeastOneReport(hasAtLeastOneReport)
            .build();
    }

    public TaskDetailResponse toDetail(Task task) {
        return TaskDetailResponse.builder()
            .id(task.getId())
            .userInfoCreated(userInfoMapper.shortenUserInfo(task.getUserInfoCreated()))
            .name(task.getName())
            .level(task.getLevel())
            .taskType(task.getTaskType())
            .priority(task.getPriority())
            .isLocked(task.isLocked())
            .startDate(task.getStartDate())
            .endDate(task.getEndDate())
            .deadline(task.getDeadline())
            .createdTime(task.getCreatedTime())
            .updatedTime(task.getUpdatedTime())
            .taskInfo(EntityDelegatorDTO.builder()
                .id(task.getRootTask().getId())
                .name(task.getRootTask().getName())
                .build())
            .collectionInfo(EntityDelegatorDTO.builder()
                .id(task.getCollection().getId())
                .name(task.getCollection().getName())
                .build())
            .phaseInfo(EntityDelegatorDTO.builder()
                .id(task.getCollection().getPhase().getId())
                .name(task.getCollection().getPhase().getName())
                .build())
            .projectInfo(EntityDelegatorDTO.builder()
                .id(task.getCollection().getPhase().getProject().getId())
                .name(task.getCollection().getPhase().getProject().getName())
                .build())
            .build();
    }

    public TaskDelegatorResponse toDelegator(Task task) {
        var response = TaskDelegatorResponse.builder()
            .collectionInfo(EntityDelegatorDTO.builder()
                .id(task.getCollection().getId())
                .name(task.getCollection().getName())
                .build())
            .phaseInfo(EntityDelegatorDTO.builder()
                .id(task.getCollection().getPhase().getId())
                .name(task.getCollection().getPhase().getName())
                .build())
            .projectInfo(EntityDelegatorDTO.builder()
                .id(task.getCollection().getPhase().getProject().getId())
                .name(task.getCollection().getPhase().getProject().getName())
                .build())
            .build();

        if (task.getRootTask() != null)
            response.setTaskInfo(EntityDelegatorDTO.builder()
                .id(task.getRootTask().getId())
                .name(task.getRootTask().getName())
                .build());

        return response;
    }
}
