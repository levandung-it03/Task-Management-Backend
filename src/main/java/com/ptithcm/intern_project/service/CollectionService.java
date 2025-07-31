package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.mapper.CollectionMapper;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.repository.CollectionRepository;
import com.ptithcm.intern_project.service.trans.CollectionTransService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CollectionService {
    CollectionRepository collectionRepository;
    CollectionTransService collectionTransService;
    UserInfoService userInfoService;
    CollectionMapper collectionMapper;
    TaskService taskService;
    JwtService jwtService;

    public IdResponse createTask(Long collectionId, TaskRequest request, String token) {
        var collectionHasTask = collectionRepository.findById(collectionId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        return taskService.create(collectionHasTask, request, token);
    }

    public boolean existsByPhaseId(Long id) {
        return collectionRepository.existsByPhaseId(id);
    }

    public IdResponse createCollection(Phase phase, CollectionRequest request, String token) {
        var createdUser = userInfoService.getUserInfo(token);

        this.validateCollection(request, phase);

        var collection = collectionMapper.newModel(request, createdUser);
        collection.setPhase(phase);

        var savedCollection = collectionRepository.save(collection);
        return IdResponse.builder().id(savedCollection.getId()).build();
    }
    
    public void validateCollection(CollectionRequest request, Phase phase) {
        var isStartingBeforeProject = request.getStartDate().isBefore(phase.getStartDate());
        if (isStartingBeforeProject)    throw new AppExc(ErrorCodes.START_BEFORE_PROJECT);

        var isEndingAfterProject = request.getDueDate().isAfter(phase.getDueDate());
        if (isEndingAfterProject)    throw new AppExc(ErrorCodes.END_AFTER_PROJECT);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<Collection> getAllRelatedCollections(Phase phase, String token) {
        String username = jwtService.readPayload(token).get("sub");

        var hasHighRoleOnProject = phase.getProject().getProjectUsers().stream()
            .anyMatch(projectRole -> projectRole.getUserInfo().getAccount().getUsername().equals(username));
        if (hasHighRoleOnProject)
            return collectionRepository.findAllByPhaseId(phase.getId());

        return collectionRepository.findAllByAssignedUsernameAndPhaseId(phase.getId(), username);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Collection get(Long id, String token) {
        var gotCollection = collectionRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeeCollection = collectionTransService.canSeeCollections(gotCollection.getPhase().getProject(), token);
        if (!canSeeCollection)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return gotCollection;
    }

    public void update(Long id, CollectionRequest request, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var collection = collectionRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        this.validateCollection(request, collection.getPhase());

        var isEndedProject = collection.getPhase().getProject().getEndDate() != null;
        if (isEndedProject) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        var isOwner = collection.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        collectionMapper.update(collection, request);
    }

    public void delete(Long id, String token) {
        var deletedCollection = collectionRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        var username = jwtService.readPayload(token).get("sub");

        var isOwner = deletedCollection.getPhase()
            .getProject().getUserInfoCreated()
            .getAccount()
            .getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var hasRelatedData = taskService.existsByCollectionId(id);
        if (!hasRelatedData) throw new AppExc(ErrorCodes.CANT_DELETE_PHASE);

        collectionRepository.delete(deletedCollection);
    }

    public List<Task> getAllRelatedTasks(Long collectionId, String token) {
        var collection = collectionRepository.findById(collectionId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        return taskService.getAllRelatedTasks(collection, token);
    }
}
