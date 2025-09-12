package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.model.dto.request.CollectionRequest;
import com.ptithcm.intern_project.model.dto.request.TaskRequest;
import com.ptithcm.intern_project.model.dto.response.CollectionDetailResponse;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.model.dto.response.ShortTaskResponse;
import com.ptithcm.intern_project.model.Collection;

import java.util.List;

public interface ICollectionService {

    IdResponse createTask(Long collectionId, TaskRequest request, String token);

    Collection get(Long id, String token);

    void update(Long id, CollectionRequest request, String token);

    void delete(Long id, String token);

    List<ShortTaskResponse> getAllRelatedTasks(Long collectionId, String token);

    void completeCollection(Long id, String token);

    CollectionDetailResponse getCollectionDetail(Long collectionId, String token);

    List<UserStatisticDTO> getUsersStatistic(Long collectionId);
}
