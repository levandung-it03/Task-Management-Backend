package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.repository.CollectionRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CollectionService {
    CollectionRepository collectionRepository;
    TaskService taskService;

    public IdResponse createTask(Long collectionId, TaskRequest request, String token) {
        var collectionHasTask = collectionRepository.findById(collectionId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectActive = collectionHasTask.getPhase().getProject().isActive();
        if (!isProjectActive)   throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        return taskService.create(collectionHasTask, request, token);
    }
}
