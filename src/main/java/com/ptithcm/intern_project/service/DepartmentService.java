package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Department;
import com.ptithcm.intern_project.jpa.repository.DepartmentRepository;
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
    UserInfoService userInfoService;
    DepartmentRepository departmentRepository;

    public IdResponse create(DepartmentRequest request) {
        if (departmentRepository.existsByName(request.getName())) {
            throw new AppExc(ErrorCodes.DEPARTMENT_ALREADY_EXISTS);
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
            .orElseThrow(() -> new AppExc(ErrorCodes.DEPARTMENT_NOT_FOUND));
        if (userInfoService.existsByDepartmentId(id)) {
            throw new AppExc(ErrorCodes.DEPARTMENT_WAS_USED);
        }
        department.setName(request.getName());
        departmentRepository.save(department);
    }

    public void delete(Long id) {
        if (!departmentRepository.existsById(id)) {
            throw new AppExc(ErrorCodes.DEPARTMENT_NOT_FOUND);
        }
        if (userInfoService.existsByDepartmentId(id)) {
            throw new AppExc(ErrorCodes.DEPARTMENT_WAS_USED);
        }
        departmentRepository.deleteById(id);
    }

    public Department get(Long id) {
        return departmentRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.DEPARTMENT_NOT_FOUND));
    }

    public List<Department> getAll() {
        return departmentRepository.findAll().stream().toList();
    }
}
