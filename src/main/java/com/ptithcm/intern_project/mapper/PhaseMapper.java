package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.jpa.model.Phase;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@NoArgsConstructor
public class PhaseMapper {

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
}
