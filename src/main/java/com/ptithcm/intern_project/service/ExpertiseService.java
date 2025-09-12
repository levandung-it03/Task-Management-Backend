package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.Expertise;
import com.ptithcm.intern_project.model.dto.request.ExpertiseRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;
import com.ptithcm.intern_project.repository.ExpertiseRepository;
import com.ptithcm.intern_project.service.interfaces.IExpertiseService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExpertiseService implements IExpertiseService {
    UserInfoService userInfoService;
    ExpertiseRepository expertiseRepository;

    @Override
    public IdResponse create(ExpertiseRequest request) {
        if (expertiseRepository.existsByName(request.getName())) {
            throw new AppExc(ErrorCodes.EXPERTISE_ALREADY_EXISTS);
        }
        var expertise = Expertise.builder()
            .name(request.getName())
            .build();
        return IdResponse.builder()
            .id(expertiseRepository.save(expertise).getId())
            .build();
    }

    @Override
    public void update(Long id, ExpertiseRequest request) {
        Expertise expertise = expertiseRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.EXPERTISE_NOT_FOUND));
        if (userInfoService.existsByExpertiseId(id)) {
            throw new AppExc(ErrorCodes.DEPARTMENT_WAS_USED);
        }
        expertise.setName(request.getName());
        expertiseRepository.save(expertise);
    }

    @Override
    public void delete(Long id) {
        if (!expertiseRepository.existsById(id)) {
            throw new AppExc(ErrorCodes.DEPARTMENT_NOT_FOUND);
        }
        if (userInfoService.existsByExpertiseId(id)) {
            throw new AppExc(ErrorCodes.DEPARTMENT_WAS_USED);
        }
        expertiseRepository.deleteById(id);
    }

    @Override
    public Expertise get(Long id) {
        return expertiseRepository.findById(id)
            .orElseThrow(() -> new AppExc(ErrorCodes.EXPERTISE_NOT_FOUND));
    }

    @Override
    public List<Expertise> getAll() {
        return expertiseRepository.findAll().stream().toList();
    }

    public Expertise findById(Long expertiseId) {
        return expertiseRepository.findById(expertiseId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
    }

    public List<Expertise> findAll() {
        return expertiseRepository.findAll();
    }
}
