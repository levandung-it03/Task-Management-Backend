package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.dto.general.EntityDelegatorDTO;
import com.ptithcm.intern_project.model.dto.request.PhaseRequest;
import com.ptithcm.intern_project.model.dto.response.PhaseDetailResponse;
import com.ptithcm.intern_project.model.dto.response.PhaseResponse;
import com.ptithcm.intern_project.model.Phase;
import com.ptithcm.intern_project.model.UserInfo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@AllArgsConstructor
public class PhaseMapper {
    UserInfoMapper userInfoMapper;

    public Phase newModel(PhaseRequest request, UserInfo userInfoCreated) {
        return Phase.builder()
            .userInfoCreated(userInfoCreated)
            .name(request.getName())
            .description(request.getDescription())
            .startDate(request.getStartDate())
            .dueDate(request.getDueDate())
            .createdTime(LocalDateTime.now())
            .updatedTime(LocalDateTime.now())
            .build();
    }

    public void update(Phase phase, PhaseRequest request) {
        phase.setName(request.getName());
        phase.setDescription(request.getDescription());
        phase.setStartDate(request.getStartDate());
        phase.setDueDate(request.getDueDate());
        phase.setUpdatedTime(LocalDateTime.now());
    }

    public PhaseResponse toResponse(Phase phase) {
        return PhaseResponse.builder()
            .id(phase.getId())
            .name(phase.getName())
            .description(phase.getDescription())
            .startDate(phase.getStartDate())
            .dueDate(phase.getDueDate())
            .endDate(phase.getEndDate())
            .createdTime(phase.getCreatedTime())
            .updatedTime(phase.getUpdatedTime())
            .build();
    }

    public PhaseDetailResponse toDetail(Phase phase) {
        return PhaseDetailResponse.builder()
            .id(phase.getId())
            .userInfoCreated(userInfoMapper.shortenUserInfo(phase.getUserInfoCreated()))
            .name(phase.getName())
            .description(phase.getDescription())
            .startDate(phase.getStartDate())
            .dueDate(phase.getDueDate())
            .endDate(phase.getEndDate())
            .createdTime(phase.getCreatedTime())
            .updatedTime(phase.getUpdatedTime())
            .projectInfo(EntityDelegatorDTO.builder()
                .id(phase.getProject().getId())
                .name(phase.getProject().getName())
                .build())
            .build();
    }
}
