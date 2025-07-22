package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.enums.*;
import com.ptithcm.intern_project.service.EnumService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/api/v1/public/enum")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class EnumsController {
    EnumService enumService;

    @GetMapping("/report-status")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getReportStatus() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(ReportStatus.class));
    }

    @GetMapping("/role-on-entity")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getRoleOnEntity() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(RoleOnEntity.class));
    }

    @GetMapping("/specialty")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getSpecialty() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(Specialty.class));
    }

    @GetMapping("/task-level")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getTaskLevel() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(TaskLevel.class));
    }

    @GetMapping("/task-priority")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getTaskPriority() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(TaskPriority.class));
    }

    @GetMapping("/task-type")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getTaskType() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(TaskType.class));
    }

    @GetMapping("/user-task-status")
    public ResponseEntity<RestApiResponse<HashMap<String, String>>> getUserTaskStatus() {
        return RestApiResponse.fromScs(SuccessCodes.GET_ENUMS, enumService.buildEnum(UserTaskStatus.class));
    }

}
