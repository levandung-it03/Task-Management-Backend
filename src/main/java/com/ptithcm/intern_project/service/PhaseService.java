package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.mapper.PhaseMapper;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.model.Project;
import com.ptithcm.intern_project.jpa.repository.PhaseRepository;
import com.ptithcm.intern_project.service.trans.PhaseTransService;
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
public class PhaseService {
    PhaseRepository phaseRepository;
    PhaseTransService phaseTransService;
    UserInfoService userInfoService;
    CollectionService collectionService;
    PhaseMapper phaseMapper;
    JwtService jwtService;

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public IdResponse create(Project project, PhaseRequest request, String token) {
        var createdUser = userInfoService.getUserInfo(token);

        this.validatePhase(request, project);

        var phase = phaseMapper.newModel(request, createdUser);
        phase.setProject(project);

        var savedPhase = phaseRepository.save(phase);
        return IdResponse.builder().id(savedPhase.getId()).build();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void update(Long id, PhaseRequest request, String token) {
        String username = jwtService.readPayload(token).get("sub");
        var phase = phaseRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        this.validatePhase(request, phase.getProject());

        var isEndedProject = phase.getProject().getEndDate() != null;
        if (isEndedProject) throw new AppExc(ErrorCodes.PROJECT_WAS_CLOSED);

        var isOwner = phase.getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        phaseMapper.update(phase, request);
    }

    public void validatePhase(PhaseRequest request, Project project) {
        var isStartingBeforeProject = request.getStartDate().isBefore(project.getStartDate());
        if (isStartingBeforeProject)    throw new AppExc(ErrorCodes.START_BEFORE_PROJECT);

        var isEndingAfterProject = request.getDueDate().isAfter(project.getDueDate());
        if (isEndingAfterProject)    throw new AppExc(ErrorCodes.END_AFTER_PROJECT);
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

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public Phase get(Long id, String token) {
        var gotPhase = phaseRepository.findById(id).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));

        var canSeePhase = phaseTransService.canSeePhases(gotPhase.getProject(), token);
        if (!canSeePhase)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return gotPhase;
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void delete(Long id, String token) {
        var deletedPhase = phaseRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        var username = jwtService.readPayload(token).get("sub");

        var isOwner = deletedPhase.getProject().getUserInfoCreated().getAccount().getUsername().equals(username);
        if (!isOwner)   throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var hasRelatedData = collectionService.existsPhaseId(id);
        if (!hasRelatedData) throw new AppExc(ErrorCodes.CANT_DELETE_PHASE);

        phaseRepository.delete(deletedPhase);
    }

    public IdResponse createCollection(Long phaseId, CollectionRequest request, String token) {
        var phase = phaseRepository.findById(phaseId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        return collectionService.createCollection(phase, request, token);
    }

    public List<Collection> getAllRelatedCollections(Long phaseId, String token) {
        var phase = phaseRepository.findById(phaseId).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        return collectionService.getAllRelatedCollections(phase, token);
    }
}
