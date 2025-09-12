package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.Expertise;
import com.ptithcm.intern_project.model.dto.request.ExpertiseRequest;
import com.ptithcm.intern_project.model.dto.response.IdResponse;

import java.util.List;

public interface IExpertiseService {

    IdResponse create(ExpertiseRequest request);

    void update(Long id, ExpertiseRequest request);

    void delete(Long id);

    Expertise get(Long id);

    List<Expertise> getAll();
}
