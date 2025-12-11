package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.model.dto.response.CollectionDetailResponse;
import com.ptithcm.intern_project.model.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.enums.ProjectStatus;
import com.ptithcm.intern_project.mapper.CollectionMapper;
import com.ptithcm.intern_project.model.dto.request.CollectionRequest;
import com.ptithcm.intern_project.model.dto.request.TaskRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.Collection;
import com.ptithcm.intern_project.model.Phase;
import com.ptithcm.intern_project.repository.CollectionRepository;
import com.ptithcm.intern_project.mapper.TaskMapper;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.service.auth.JwtService;
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

        var isProjectInProgress = collectionHasTask.getPhase().getProject().getStatus()
            .equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress)   throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        this.validateEndedTimeOnDependedEntity(collectionHasTask);

        return taskService.create(collectionHasTask, request, token);
    }

    private void validateEndedTimeOnDependedEntity(Collection collectionHasTask) {
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

        var projSts = collection.getPhase().getProject().getStatus();
        var canProjectBeUpdated = projSts.equals(ProjectStatus.IN_PROGRESS) || projSts.equals(ProjectStatus.CREATED);
        if (!canProjectBeUpdated)
            throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        this.validateEndedTimeOnDependedEntity(collection);

        var tasks = taskService.findAllByCollectionId(id);
        for (Task task : tasks) {
            if (request.getStartDate().isAfter(task.getStartDate()))
                throw new AppExc(ErrorCodes.START_AFTER_TASK);
            if (request.getDueDate().isBefore(task.getDeadline()))
                throw new AppExc(ErrorCodes.END_BEFORE_COLLECTION);
        }
        var isOwner = collection.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var existsCollectionName = collectionRepository.existsByUpdatedNameAndPhaseId(
            collection.getId(),
            request.getName(),
            collection.getPhase().getId());
        if (existsCollectionName) throw new AppExc(ErrorCodes.DUPLICATED_NAME);

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

        var projSts = deletedCollection.getPhase().getProject().getStatus();
        var canProjectBeUpdated = projSts.equals(ProjectStatus.IN_PROGRESS) || projSts.equals(ProjectStatus.CREATED);
        if (!canProjectBeUpdated)
            throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        this.validateEndedTimeOnDependedEntity(deletedCollection);

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
                if (prevValue != nextValue) return nextValue - prevValue;

                int prevPrior = prev.getPriority().ordinal();
                int nextPrior = next.getPriority().ordinal();
                if (prevPrior != nextPrior) return prevPrior - nextPrior;

                LocalDate prevStart = prev.getStartDate();
                LocalDate nextStart = next.getStartDate();
                return prevStart.compareTo(nextStart);
            }).toList();
    }

    public boolean existsByPhaseId(Long id) {
        return collectionRepository.existsByPhaseId(id);
    }

    public IdResponse createCollection(Phase phase, CollectionRequest request, String token) {
        var createdUser = userInfoService.getUserInfo(token);
        //--Checked project in-progress by "phase"
        //--Checked phase is not ended

        this.validateCollection(request, phase);

        var existsCollectionName = collectionRepository.existsByNameAndPhaseId(request.getName(), phase.getId());
        if (existsCollectionName) throw new AppExc(ErrorCodes.DUPLICATED_NAME);

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

        var isProjectInProgress = collection.getPhase().getProject().getStatus()
            .equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress)   throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        this.validateEndedTimeOnDependedEntity(collection);

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
            .map(userInfoMapper::toStatisticUser)
            .sorted((prev, next) -> (int) (next.getTotalPoint() - prev.getTotalPoint()))    
            .toList();
    }
}
