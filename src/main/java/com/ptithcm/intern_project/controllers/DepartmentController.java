package com.ptithcm.intern_project.controllers;

import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrappers.RestApiResponse;
import com.ptithcm.intern_project.dataJpa.entities.Department;
import com.ptithcm.intern_project.dto.request.DepartmentRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.services.DepartmentService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/private/department")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DepartmentController {
    DepartmentService departmentService;

    @PostMapping
    public ResponseEntity<RestApiResponse<IdResponse>> create(@Valid @RequestBody DepartmentRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, departmentService.create(request));
    }

    @PutMapping("/{id}")
    public ResponseEntity<RestApiResponse<Void>> update(@PathVariable Long id,
                                                        @Valid @RequestBody DepartmentRequest request) {
        departmentService.update(id, request);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<RestApiResponse<Void>> delete(@PathVariable Long id) {
        departmentService.delete(id);
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<RestApiResponse<Department>> get(@PathVariable Long id) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, departmentService.get(id));
    }

    @GetMapping("/get-all")
    public ResponseEntity<RestApiResponse<List<Department>>> getAll() {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, departmentService.getAll());
    }
}
