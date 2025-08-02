package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.request.CollectionRequest;
import com.ptithcm.intern_project.jpa.model.Collection;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
@NoArgsConstructor
public class CollectionMapper {

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
}
