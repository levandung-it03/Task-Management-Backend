package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.service.CollectionService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.ROLE_LEAD;
import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.ROLE_PM;

@RestController
@RequestMapping("/api/v1/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CollectionController {
    CollectionService collectionService;
    
    @Operation(description = "Create Task")
    @PostMapping({
        ROLE_PM + "/collection/{collectionId}/create-task",
        ROLE_LEAD + "/collection/{collectionId}/create-task"})
    public ResponseEntity<RestApiResponse<IdResponse>> createTask(
        @PathVariable("collectionId") Long collectionId,
        @Valid @RequestBody TaskRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, collectionService.createTask(collectionId, request, token));
    }
}
