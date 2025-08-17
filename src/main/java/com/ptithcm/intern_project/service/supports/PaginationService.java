package com.ptithcm.intern_project.service.supports;

import com.ptithcm.intern_project.dto.request.PaginationRequest;
import jakarta.persistence.Id;
import org.springframework.data.domain.Sort;

import java.lang.reflect.Field;

public class PaginationService {
    public static final int PAGE_SIZE = 10;

    public static Sort getSortOption(PaginationRequest request, Class<?> entityClass) {
        var direction = request.getSortedMode() == -1
            ? Sort.Direction.DESC
            : Sort.Direction.ASC;

        String sortedField = request.getSortedField();
        var noSortedField = sortedField == null || sortedField.isEmpty();
        if (noSortedField) {
            for (Field field : entityClass.getDeclaredFields()) {
                if (field.isAnnotationPresent(Id.class)) {
                    sortedField = field.getName();
                }
            }
        }
        return Sort.by(direction, sortedField);
    }
}
