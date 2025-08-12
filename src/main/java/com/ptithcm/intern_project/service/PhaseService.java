package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.dto.response.CollectionResponse;
import com.ptithcm.intern_project.dto.response.PhaseDetailResponse;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.enums.ProjectStatus;
import com.ptithcm.intern_project.mapper.CollectionMapper;
import com.ptithcm.intern_project.mapper.PhaseMapper;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.repository.PhaseRepository;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.IPhaseService;
import com.ptithcm.intern_project.service.trans.PhaseTransService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PhaseService implements IPhaseService {
    PhaseRepository phaseRepository;
    PhaseTransService phaseTransService;
    UserInfoService userInfoService;
    CollectionService collectionService;
    PhaseMapper phaseMapper;
    CollectionMapper collectionMapper;
    JwtService jwtService;

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long id, PhaseRequest request, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var phase = phaseRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        this.validatePhase(request, phase.getProject());

        var isProjectInProgress = phase.getProject().getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = phase.getEndDate() != null;
        if (isPhaseEnded)   throw new AppExc(ErrorCodes.PHASE_ENDED);

        var isOwner = phase.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        phaseMapper.update(phase, request);
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public List<Phase> getAllRelatedPhases(Project project, String token) {
        String username = jwtService.readPayload(token).get("sub");

        var hasHighRoleOnProject = project.getProjectUsers().stream()
            .anyMatch(projectRole -> projectRole.getUserInfo().getAccount().getUsername().equals(username));
        if (hasHighRoleOnProject)
            return phaseRepository.findAllByProjectId(project.getId());

        return phaseRepository.findAllByAssignedUsernameAndProjectId(project.getId(), username);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Phase get(Long id, String token) {
        var gotPhase = phaseRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeePhase = phaseTransService.canSeePhases(gotPhase.getProject(), token);
        if (!canSeePhase)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return gotPhase;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void delete(Long id, String token) {
        var deletedPhase = phaseRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        var username = jwtService.readPayload(token).get("sub");

        var isOwner = deletedPhase.getProject().getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isProjectInProgress = deletedPhase.getProject().getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = deletedPhase.getEndDate() != null;
        if (isPhaseEnded)   throw new AppExc(ErrorCodes.PHASE_ENDED);

        var hasRelatedData = collectionService.existsByPhaseId(id);
        if (hasRelatedData) throw new AppExc(ErrorCodes.CANT_DELETE_PHASE_WITH_COLLECTION);

        phaseRepository.delete(deletedPhase);
    }

    @Override
    public IdResponse createCollection(Long phaseId, CollectionRequest request, String token) {
        var phase = phaseRepository
            .findById(phaseId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isProjectInProgress = phase.getProject().getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var isPhaseEnded = phase.getEndDate() != null;
        if (isPhaseEnded)   throw new AppExc(ErrorCodes.PHASE_ENDED);

        return collectionService.createCollection(phase, request, token);
    }

    @Override
    public List<CollectionResponse> getAllRelatedCollections(Long phaseId, String token) {
        var phase = phaseRepository.findById(phaseId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        return collectionService.getAllRelatedCollections(phase, token)
            .stream()
            .map(collectionMapper::toResponse)
            .sorted((prev, next) -> {
                int prevValue = prev.getEndDate() == null ? -1 : 1;
                int nextValue = next.getEndDate() == null ? -1 : 1;
                return prevValue - nextValue;
            })
            .sorted(Comparator.comparing(CollectionResponse::getStartDate))
            .toList();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public IdResponse create(Project project, PhaseRequest request, String token) {
        //--Checked in progress by "project"
        var createdUser = userInfoService.getUserInfo(token);

        this.validatePhase(request, project);

        var phase = phaseMapper.newModel(request, createdUser);
        phase.setProject(project);

        var savedPhase = phaseRepository.save(phase);
        return IdResponse.builder().id(savedPhase.getId()).build();
    }

    public void validatePhase(PhaseRequest request, Project project) {
        var isStartingBeforeProject = request.getStartDate().isBefore(project.getStartDate());
        if (isStartingBeforeProject)    throw new AppExc(ErrorCodes.START_BEFORE_PROJECT);

        var isEndingAfterProject = request.getDueDate().isAfter(project.getDueDate());
        if (isEndingAfterProject)    throw new AppExc(ErrorCodes.END_AFTER_PROJECT);
    }

    public boolean existsByProjectId(Long id) {
        return phaseRepository.existsByProjectId(id);
    }

    public List<Phase> findAllProjectId(Long projectId) {
        return phaseRepository.findAllByProjectId(projectId);
    }

    public Map<Long, String> getSimpleCollections(Long phaseId) {
        return collectionService.findAllByPhaseId(phaseId)
            .stream().collect(Collectors.toMap(Collection::getId, Collection::getName));
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void completePhase(Long id, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var phase = phaseRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var isOwner = phase.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)    throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var isProjectInProgress = phase.getProject().getStatus().equals(ProjectStatus.IN_PROGRESS);
        if (!isProjectInProgress) throw new AppExc(ErrorCodes.PROJECT_IS_NOT_IN_PROGRESS);

        var existsCollectionNotCompleted = collectionService.existsCollectionNotCompletedByPhaseId(phase.getId());
        if (existsCollectionNotCompleted)   throw new AppExc(ErrorCodes.CANT_COMPLETE_PHASE);

        phase.setEndDate(LocalDate.now());
        phaseRepository.save(phase);
    }

    @Override
    public PhaseDetailResponse getPhaseDetail(Long phaseId, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var phase = phaseRepository.findById(phaseId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeeCollection = phaseTransService.canSeePhases(phase.getProject(), username);
        if (!canSeeCollection)  throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return phaseMapper.toDetail(phase);
    }

    public boolean existsNotCompleteByProjectId(Long projectId) {
        return phaseRepository.existsNotCompleteByProjectId(projectId);
    }
}
