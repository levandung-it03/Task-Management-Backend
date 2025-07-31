package com.ptithcm.intern_project.controller;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;
import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.Department;
import com.ptithcm.intern_project.dto.request.DepartmentRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.service.DepartmentService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/private")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DepartmentController {
    DepartmentService departmentService;

    @Operation(description = "Create Department")
    @ApiResponses(value = {})
    @PostMapping(ROLE_EMP + "/department")
    public ResponseEntity<RestApiResponse<IdResponse>> create(@Valid @RequestBody DepartmentRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, departmentService.create(request));
    }

    @Operation(description = "Update specified Department")
    @PutMapping(ROLE_EMP + "/department/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(@PathVariable Long id,
                                                        @Valid @RequestBody DepartmentRequest request) {
        departmentService.update(id, request);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @Operation(description = "Delete specified Department")
    @DeleteMapping(ROLE_EMP + "/department/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(@PathVariable Long id) {
        departmentService.delete(id);
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
    }

    @Operation(description = "Get specified Department")
    @GetMapping({ROLE_EMP + "/department/{id}", ROLE_LEAD + "/department/{id}", ROLE_EMP + "/department/{id}"})
    public ResponseEntity<RestApiResponse<Department>> get(@PathVariable Long id) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, departmentService.get(id));
    }

    @Operation(description = "Get all Departments")
    @GetMapping({ROLE_EMP + "/department/all", ROLE_LEAD + "/department/all", ROLE_EMP + "/department/all"})
    public ResponseEntity<RestApiResponse<List<Department>>> getAll() {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, departmentService.getAll());
    }
}
