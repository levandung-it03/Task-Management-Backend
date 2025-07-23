package com.ptithcm.intern_project.controller;

import static com.ptithcm.intern_project.common.constvalues.AuthorityValues.*;
import com.ptithcm.intern_project.common.enums.SuccessCodes;
import com.ptithcm.intern_project.common.wrapper.RestApiResponse;
import com.ptithcm.intern_project.jpa.model.Department;
import com.ptithcm.intern_project.dto.request.DepartmentRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.service.DepartmentService;
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

    @PostMapping({ROLE_EMP + "/department", ROLE_LEAD + "/department"})
    public ResponseEntity<RestApiResponse<IdResponse>> create(@Valid @RequestBody DepartmentRequest request) {
        return RestApiResponse.fromScs(SuccessCodes.CREATED, departmentService.create(request));
    }

    @PostMapping({ROLE_EMP + "/department/{id}", ROLE_LEAD + "/department/{id}"})
    public ResponseEntity<RestApiResponse<Void>> update(@PathVariable Long id,
                                                        @Valid @RequestBody DepartmentRequest request) {
        departmentService.update(id, request);
        return RestApiResponse.fromScs(SuccessCodes.UPDATED);
    }

    @DeleteMapping({ROLE_EMP + "/department/{id}", ROLE_LEAD + "/department/{id}"})
    public ResponseEntity<RestApiResponse<Void>> delete(@PathVariable Long id) {
        departmentService.delete(id);
        return RestApiResponse.fromScs(SuccessCodes.DELETED);
    }

    @GetMapping({ROLE_EMP + "/department/{id}", ROLE_LEAD + "/department/{id}"})
    public ResponseEntity<RestApiResponse<Department>> get(@PathVariable Long id) {
        return RestApiResponse.fromScs(SuccessCodes.GET_DETAIL, departmentService.get(id));
    }

    @GetMapping({ROLE_EMP + "/department/all", ROLE_LEAD + "/department/all"})
    public ResponseEntity<RestApiResponse<List<Department>>> getAll() {
        return RestApiResponse.fromScs(SuccessCodes.GET_LIST, departmentService.getAll());
    }
}
