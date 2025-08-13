package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.dto.response.CollectionDetailResponse;
import com.ptithcm.intern_project.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.ProjectStatus;
import com.ptithcm.intern_project.mapper.CollectionMapper;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.TaskRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.repository.CollectionRepository;
import com.ptithcm.intern_project.mapper.TaskMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.ICollectionService;
import com.ptithcm.intern_project.service.trans.CollectionTransService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class CollectionService implements ICollectionService {
    CollectionRepository collectionRepository;
    CollectionTransService collectionTransService;
    UserInfoService userInfoService;
    CollectionMapper collectionMapper;
    TaskService taskService;
    JwtService jwtService;
    TaskMapper taskMapper;
    TaskForUsersService taskForUsersService;
    UserInfoMapper userInfoMapper;

    @Override
    public IdResponse createTask(Long collectionId, TaskRequest request, String token) {
        var collectionHasTask = collectionRepository.findById(collectionId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        if (request.getStartDate().isBefore(collectionHasTask.getStartDate()))
            throw new AppExc(ErrorCodes.START_BEFORE_COLLECTION);

        if (request.getDeadline().isAfter(collectionHasTask.getDueDate()))
            throw new AppExc(ErrorCodes.END_AFTER_COLLECTION);

        this.validateEndedParentEntities(collectionHasTask);

        return taskService.create(collectionHasTask, request, token);
    }

    private void validateEndedParentEntities(Collection collectionHasTask) {
        var isProjectInProgress = collectionHasTask.getPhase().getProject().getStatus()
            .equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress)   throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = collectionHasTask.getPhase().getEndDate() != null;
        if (isPhaseEnded)   throw new AppExc(ErrorCodes.PHASE_ENDED);

        var isCollectionEnded = collectionHasTask.getEndDate() != null;
        if (isCollectionEnded)   throw new AppExc(ErrorCodes.COLLECTION_ENDED);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Collection get(Long id, String token) {
        var gotCollection = collectionRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeeCollection = collectionTransService.canSeeCollections(gotCollection.getPhase().getProject(), token);
        if (!canSeeCollection)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return gotCollection;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long id, CollectionRequest request, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var collection = collectionRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        this.validateCollection(request, collection.getPhase());
        this.validateEndedParentEntities(collection);

        var tasks = taskService.findAllByCollectionId(id);
        for (Task task : tasks) {
            if (request.getStartDate().isAfter(task.getStartDate()))
                throw new AppExc(ErrorCodes.START_AFTER_TASK);
            if (request.getDueDate().isBefore(task.getDeadline()))
                throw new AppExc(ErrorCodes.END_BEFORE_COLLECTION);
        }
        var isOwner = collection.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        collectionMapper.update(collection, request);
        collectionRepository.save(collection);
    }

    @Override
    public void delete(Long id, String token) {
        var deletedCollection = collectionRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        var username = jwtService.readPayload(token).get("sub");

        var isOwner = deletedCollection.getPhase()
            .getProject().getUserInfoCreated()
            .getAccount()
            .getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        this.validateEndedParentEntities(deletedCollection);

        var hasRelatedData = taskService.existsByCollectionId(id);
        if (hasRelatedData) throw new AppExc(ErrorCodes.CANT_DELETE_COLLECTION_WITH_TASKS);

        collectionRepository.delete(deletedCollection);
    }

    @Override
    public List<ShortTaskResponse> getAllRelatedTasks(Long collectionId, String token) {
        var collection = collectionRepository.findById(collectionId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        return taskService.getAllRelatedTasks(collection, token)
            .stream()
            .map(taskMapper::shortenTaskResponse)
            .sorted((prev, next) -> {
                int prevValue = prev.getEndDate() == null ? -1 : 1;
                int nextValue = next.getEndDate() == null ? -1 : 1;
                return prevValue - nextValue;
            })
            .sorted(Comparator.comparing(ShortTaskResponse::getStartDate))
            .sorted((prev, next) ->
                next.getPriority().ordinal() - prev.getPriority().ordinal()
            ).toList();
    }

    public boolean existsByPhaseId(Long id) {
        return collectionRepository.existsByPhaseId(id);
    }

    public IdResponse createCollection(Phase phase, CollectionRequest request, String token) {
        var createdUser = userInfoService.getUserInfo(token);
        //--Checked project in-progress by "phase"
        //--Checked phase is not ended

        this.validateCollection(request, phase);

        var collection = collectionMapper.newModel(request, createdUser);
        collection.setPhase(phase);

        var savedCollection = collectionRepository.save(collection);
        return IdResponse.builder().id(savedCollection.getId()).build();
    }
    
    public void validateCollection(CollectionRequest request, Phase phase) {
        var isStartingBeforePhase = request.getStartDate().isBefore(phase.getStartDate());
        if (isStartingBeforePhase)    throw new AppExc(ErrorCodes.START_BEFORE_PHASE);

        var isEndingAfterPhase = request.getDueDate().isAfter(phase.getDueDate());
        if (isEndingAfterPhase)    throw new AppExc(ErrorCodes.END_AFTER_PHASE);
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

    public List<Collection> findAllByPhaseId(Long phaseId) {
        return collectionRepository.findAllByPhaseId(phaseId);
    }

    @Override
    public void completeCollection(Long id, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var collection = collectionRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isOwner = collection.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        this.validateEndedParentEntities(collection);

        var existsTaskNotCompleted = taskService.existsTaskNotCompletedByCollectionId(collection.getId());
        if (existsTaskNotCompleted)   throw new AppExc(ErrorCodes.CANT_COMPLETE_COLLECTION);

        collection.setEndDate(LocalDate.now());
        collectionRepository.save(collection);
    }

    @Override
    public CollectionDetailResponse getCollectionDetail(Long collectionId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var collection = collectionRepository.findById(collectionId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeeCollection = collectionTransService.canSeeCollections(collection.getPhase().getProject(), username);
        if (!canSeeCollection)  throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return collectionMapper.toDetail(collection);
    }

    public boolean existsCollectionNotCompletedByPhaseId(Long phaseId) {
        return collectionRepository.existsCollectionNotCompletedByPhaseId(phaseId);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<UserStatisticDTO> getUsersStatistic(Long collectionId) {
        List<TaskForUsers> usersTask = taskForUsersService.findAllByTaskCollectionId(collectionId);
        return usersTask.stream()
            .map(userTask -> userInfoMapper.toStatisticUser(userTask.getReports()))
            .toList();
    }
}
