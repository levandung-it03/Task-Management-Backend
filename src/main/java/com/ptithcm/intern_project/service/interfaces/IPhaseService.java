package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.model.dto.request.CollectionRequest;
import com.ptithcm.intern_project.model.dto.request.PhaseRequest;
import com.ptithcm.intern_project.model.dto.response.CollectionResponse;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.dto.response.PhaseDetailResponse;
import com.ptithcm.intern_project.model.Phase;

import java.util.List;

public interface IPhaseService {

    Phase get(Long id, String token);

    void update(Long id, PhaseRequest request, String token);

    void delete(Long id, String token);

    IdResponse createCollection(Long phaseId, CollectionRequest request, String token);

    List<CollectionResponse> getAllRelatedCollections(Long phaseId, String token);

    void completePhase(Long id, String token);

    PhaseDetailResponse getPhaseDetail(Long phaseId, String token);

    List<UserStatisticDTO> getUsersStatistic(Long phaseId);
}
