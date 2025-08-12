package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.EntityDelegatorDTO;
import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.dto.response.CollectionDetailResponse;
import com.ptithcm.intern_project.dto.response.CollectionResponse;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@AllArgsConstructor
public class CollectionMapper {
    UserInfoMapper userInfoMapper;

    public Collection newModel(CollectionRequest request, UserInfo userInfoCreated) {
        return Collection.builder()
            .userInfoCreated(userInfoCreated)
            .name(request.getName())
            .description(request.getDescription())
            .startDate(request.getStartDate())
            .dueDate(request.getDueDate())
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .build();
    }

    public void update(Collection phase, CollectionRequest request) {
        phase.setName(request.getName());
        phase.setDescription(request.getDescription());
        phase.setStartDate(request.getStartDate());
        phase.setDueDate(request.getDueDate());
        phase.setUpdatedTime(LocalDateTime.now());
    }

    public CollectionResponse toResponse(Collection collection) {
        return CollectionResponse.builder()
            .id(collection.getId())
            .name(collection.getName())
            .description(collection.getDescription())
            .startDate(collection.getStartDate())
            .dueDate(collection.getDueDate())
            .endDate(collection.getEndDate())
            .createdTime(collection.getCreatedTime())
            .updatedTime(collection.getUpdatedTime())
            .build();
    }

    public CollectionDetailResponse toDetail(Collection collection) {
        return CollectionDetailResponse.builder()
            .id(collection.getId())
            .userInfoCreated(userInfoMapper.shortenUserInfo(collection.getUserInfoCreated()))
            .name(collection.getName())
            .description(collection.getDescription())
            .startDate(collection.getStartDate())
            .dueDate(collection.getDueDate())
            .endDate(collection.getEndDate())
            .createdTime(collection.getCreatedTime())
            .updatedTime(collection.getUpdatedTime())
            .phaseInfo(EntityDelegatorDTO.builder()
                .id(collection.getPhase().getId())
                .name(collection.getPhase().getName())
                .build())
            .projectInfo(EntityDelegatorDTO.builder()
                .id(collection.getPhase().getProject().getId())
                .name(collection.getPhase().getProject().getName())
                .build())
            .build();
    }
}
