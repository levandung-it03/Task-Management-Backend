package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.enums.*;
import com.ptithcm.intern_project.redis.model.enums.OtpTypes;
import com.ptithcm.intern_project.service.EnumService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/public/v1/enum")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class EnumsController {
    EnumService enumService;

    @GetMapping("/otp-type")
    public ResponseEntity<RestApiResponse<OtpTypes[]>> getOtpType() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, OtpTypes.values());
    }

    @GetMapping("/report-status")
    public ResponseEntity<RestApiResponse<ReportStatus[]>> getReportStatus() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, ReportStatus.values());
    }

    @GetMapping("/role-on-entity")
    public ResponseEntity<RestApiResponse<RoleOnEntity[]>> getRoleOnEntity() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, RoleOnEntity.values());
    }

    @GetMapping("/specialty")
    public ResponseEntity<RestApiResponse<Specialty[]>> getSpecialty() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, Specialty.values());
    }

    @GetMapping("/task-level")
    public ResponseEntity<RestApiResponse<TaskLevel[]>> getTaskLevel() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, TaskLevel.values());
    }

    @GetMapping("/task-priority")
    public ResponseEntity<RestApiResponse<TaskPriority[]>> getTaskPriority() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, TaskPriority.values());
    }

    @GetMapping("/task-type")
    public ResponseEntity<RestApiResponse<TaskType[]>> getTaskType() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, TaskType.values());
    }

    @GetMapping("/user-task-status")
    public ResponseEntity<RestApiResponse<UserTaskStatus[]>> getUserTaskStatus() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, UserTaskStatus.values());
    }

    @GetMapping("/group-role")
    public ResponseEntity<RestApiResponse<GroupRole[]>> getGroupRole() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, GroupRole.values());
    }

}
