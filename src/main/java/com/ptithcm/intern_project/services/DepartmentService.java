package com.ptithcm.intern_project.services;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import com.ptithcm.intern_project.dataJpa.entities.Department;
import com.ptithcm.intern_project.dataJpa.repositories.DepartmentRepository;
import com.ptithcm.intern_project.dto.request.DepartmentRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class DepartmentService {

    DepartmentRepository departmentRepository;

    public IdResponse create(DepartmentRequest request) {
        if (departmentRepository.existsByName(request.getName())) {
            throw new ApplicationException(ErrorCodes.DEPARTMENT_ALREADY_EXISTS);
        }
        var department = Department.builder()
            .name(request.getName())
            .build();
        return IdResponse.builder()
            .id(departmentRepository.save(department).getId())
            .build();
    }

    public void update(Long id, DepartmentRequest request) {
        Department department = departmentRepository.findById(id)
            .orElseThrow(() -> new ApplicationException(ErrorCodes.DEPARTMENT_NOT_FOUND));
        department.setName(request.getName());
        departmentRepository.save(department);
    }

    public void delete(Long id) {
        if (!departmentRepository.existsById(id)) {
            throw new ApplicationException(ErrorCodes.DEPARTMENT_NOT_FOUND);
        }
        departmentRepository.deleteById(id);
    }

    public Department get(Long id) {
        return departmentRepository.findById(id)
            .orElseThrow(() -> new ApplicationException(ErrorCodes.DEPARTMENT_NOT_FOUND));
    }

    public List<Department> getAll() {
        return departmentRepository.findAll().stream().toList();
    }
}
