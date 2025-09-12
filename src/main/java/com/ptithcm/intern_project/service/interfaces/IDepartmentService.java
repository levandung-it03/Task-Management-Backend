package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.request.DepartmentRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.Department;

import java.util.List;

public interface IDepartmentService {

    IdResponse create(DepartmentRequest request);

    void update(Long id, DepartmentRequest request);

    void delete(Long id);

    Department get(Long id);

    List<Department> getAll();
}
