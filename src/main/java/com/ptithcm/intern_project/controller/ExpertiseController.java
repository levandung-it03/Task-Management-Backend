package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.config.enums.SuccessCodes;
import com.ptithcm.intern_project.model.Expertise;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import com.ptithcm.intern_project.model.dto.request.ExpertiseRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.service.ExpertiseService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.ptithcm.intern_project.config.constvalues.AuthorityValues.ROLE_EMP;
import static com.ptithcm.intern_project.config.constvalues.AuthorityValues.ROLE_LEAD;

@RestController
@RequestMapping("/api/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExpertiseController {
    ExpertiseService expertiseService;

    @Operation(description = "Create Expertise")
    @ApiResponses(value = {})
    @PostMapping(ROLE_EMP + "/v1/expertise")
    public ResponseEntity<RestApiResponse<IdResponse>> create(@Valid @RequestBody ExpertiseRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, expertiseService.create(request));
    }

    @Operation(description = "Update specified Expertise")
    @PutMapping(ROLE_EMP + "/v1/expertise/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(@PathVariable Long id,
                                                        @Valid @RequestBody ExpertiseRequest request) {
        expertiseService.update(id, request);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Delete specified Expertise")
    @DeleteMapping(ROLE_EMP + "/v1/expertise/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(@PathVariable Long id) {
        expertiseService.delete(id);
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
    }

    @Operation(description = "Get specified Expertise")
    @GetMapping({ROLE_EMP + "/v1/expertise/{id}", ROLE_LEAD + "/v1/expertise/{id}", ROLE_EMP + "/v1/expertise/{id}"})
    public ResponseEntity<RestApiResponse<Expertise>> get(@PathVariable Long id) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, expertiseService.get(id));
    }

    @Operation(description = "Get all Expertises")
    @GetMapping({ROLE_EMP + "/v1/expertise/all", ROLE_LEAD + "/v1/expertise/all", ROLE_EMP + "/v1/expertise/all"})
    public ResponseEntity<RestApiResponse<List<Expertise>>> getAll() {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, expertiseService.getAll());
    }
}
