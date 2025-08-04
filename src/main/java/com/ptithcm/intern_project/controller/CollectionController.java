package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.service.CollectionService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

import java.util.List;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CollectionController {
    CollectionService collectionService;
    
    @Operation(description = "Create Task")
    @PostMapping({
        ROLE_PM + "/v1/collection/{collectionId}/create-task",
        ROLE_LEAD + "/v1/collection/{collectionId}/create-task"})
    public ResponseEntity<RestApiResponse<IdResponse>> createTask(
        @PathVariable("collectionId") Long collectionId,
        @Valid @RequestBody TaskRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, collectionService.createTask(collectionId, request, token));
    }

    @Operation(description = "Get full information of specified Collection")
    @GetMapping({
        ROLE_PM + "/v1/collection/{id}",
        ROLE_LEAD + "/v1/collection/{id}",
        ROLE_EMP + "/v1/collection/{id}"})
    public ResponseEntity<RestApiResponse<Collection>> get(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, collectionService.get(id, token));
    }

    @Operation(description = "Update a Collection by PM")
    @PutMapping(ROLE_PM + "/v1/collection/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable("id") Long id,
        @Valid @RequestBody CollectionRequest request,
        @RequestHeader("Authorization") String token) {
        collectionService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Delete specified Collection")
    @DeleteMapping(ROLE_PM + "/v1/collection/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        collectionService.delete(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Get all Tasks of specified Project")
    @PostMapping({
        ROLE_PM + "/v1/collection/{id}/tasks",
        ROLE_LEAD + "/v1/collection/{id}/tasks",
        ROLE_EMP + "/v1/collection/{id}/tasks"})
    public ResponseEntity<RestApiResponse<List<ShortTaskResponse>>> getAllRelatedTasks(
        @PathVariable("id") Long collectionId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, collectionService.getAllRelatedTasks(collectionId, token));
    }
}
