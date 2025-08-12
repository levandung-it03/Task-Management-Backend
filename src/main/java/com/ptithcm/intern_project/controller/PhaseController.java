package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.dto.response.CollectionDetailResponse;
import com.ptithcm.intern_project.dto.response.CollectionResponse;
import com.ptithcm.intern_project.dto.response.PhaseDetailResponse;
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
import java.util.Map;

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
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
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
        ROLE_PM + "/v1/phase/{id}/collections",
        ROLE_LEAD + "/v1/phase/{id}/collections",
        ROLE_EMP + "/v1/phase/{id}/collections",
    })
    public ResponseEntity<RestApiResponse<List<CollectionResponse>>> getAllRelatedCollections(
        @PathVariable("id") Long phaseId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, phaseService.getAllRelatedCollections(phaseId, token));
    }


    @Operation(description = "Get simple Collections to support statistic")
    @GetMapping(ROLE_PM + "/v1/phase/{phaseId}/simple-collections")
    public ResponseEntity<RestApiResponse<Map<Long, String>>> getSimpleCollections(
        @PathVariable("phaseId") Long phaseId) {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST,
            phaseService.getSimpleCollections(phaseId));
    }

    @Operation(description = "Complete specified Phase")
    @PutMapping(ROLE_PM + "/v1/phase/{id}/complete-phase")
    public ResponseEntity<RestApiResponse<Void>> completePhase(
        @PathVariable("id") Long id,
        @RequestHeader("Authorization") String token) {
        phaseService.completePhase(id, token);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Get Phase Detail (to support Create-Task Page)")
    @GetMapping({
        ROLE_PM + "/v1/phase/{phaseId}/detail",
        ROLE_LEAD + "/v1/phase/{phaseId}/detail",
        ROLE_EMP + "/v1/phase/{phaseId}/detail"})
    public ResponseEntity<RestApiResponse<PhaseDetailResponse>> getPhaseDetail(
        @PathVariable("phaseId") Long phaseId,
        @RequestHeader("Authorization") String token) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL,
            phaseService.getPhaseDetail(phaseId, token));
    }
}
