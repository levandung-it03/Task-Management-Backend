package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.response.CollectionResponse;
import com.ptithcm.intern_project.exception.enums.SuccessCodes;
import com.ptithcm.intern_project.dto.general.RestApiResponse;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
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

import static com.ptithcm.intern_project.security.constvalues.AuthorityValues.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/private")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PhaseController {
    PhaseService phaseService;

    @Operation(description = "Get full information of specified Phase")
    @GetMapping({
        ROLE_PM + "/v1/phase/{id}",
        ROLE_LEAD + "/v1/phase/{id}",
        ROLE_EMP + "/v1/phase/{id}"})
    public ResponseEntity<RestApiResponse<Phase>> get(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, phaseService.get(id, token));
    }

    @Operation(description = "Create a Phase by PM")
    @PutMapping(ROLE_PM + "/v1/phase/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(
        @PathVariable("id") Long id,
        @Valid @RequestBody PhaseRequest request,
        @RequestHeader("Authorization") String token) {
        phaseService.update(id, request, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Delete specified Phase")
    @DeleteMapping(ROLE_PM + "/v1/phase/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        phaseService.delete(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Create a Collection of specified Phase")
    @PostMapping(ROLE_PM + "/v1/phase/{id}/create-collection")
    public ResponseEntity<RestApiResponse<IdResponse>> createCollection(
        @PathVariable("id") Long phaseId,
        @Valid @RequestBody CollectionRequest request,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, phaseService.createCollection(phaseId, request, token));
    }

    @Operation(description = "Get all Collections of specified Project")
    @PostMapping({
        ROLE_PM + "/v1/phase/{id}/get-all-related-collections",
        ROLE_LEAD + "/v1/phase/{id}/get-all-related-collections",
        ROLE_EMP + "/v1/phase/{id}/get-all-related-collections",
    })
    public ResponseEntity<RestApiResponse<List<CollectionResponse>>> getAllRelatedCollections(
        @PathVariable("id") Long phaseId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, phaseService.getAllRelatedCollections(phaseId, token));
    }
}
