package com.ptithcm.intern_project.controller;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.service.PhaseService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/private")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PhaseController {
    PhaseService phaseService;

    @Operation(description = "Get full information of specified Phase")
    @GetMapping({
        ROLE_PM + "/phase/{id}",
        ROLE_LEAD + "/phase/{id}",
        ROLE_EMP + "/phase/{id}"})
    public ResponseEntity<RestApiResponse<Phase>> get(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, phaseService.get(id, token));
    }

    @Operation(description = "Create a Phase by PM")
    @PutMapping(ROLE_PM + "/phase/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable("id") Long id,
        @Valid @RequestBody PhaseRequest request,
        @RequestHeader("Authorization") String token) {
        phaseService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @DeleteMapping(ROLE_PM + "/phase/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        phaseService.delete(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Create a Collection of specified Phase")
    @PostMapping(ROLE_PM + "/phase/{id}/create-collection")
    public ResponseEntity<RestApiResponse<IdResponse>> createCollection(
        @PathVariable("id") Long phaseId,
        @Valid @RequestBody CollectionRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, phaseService.createCollection(phaseId, request, token));
    }

    @Operation(description = "Get all Collections of specified Project")
    @PostMapping({
        ROLE_PM + "/phase/{id}/get-all-related-collections",
        ROLE_LEAD + "/phase/{id}/get-all-related-collections",
        ROLE_EMP + "/phase/{id}/get-all-related-collections",
    })
    public ResponseEntity<RestApiResponse<List<Collection>>> getAllRelatedCollections(
        @PathVariable("id") Long phaseId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, phaseService.getAllRelatedCollections(phaseId, token));
    }
}
