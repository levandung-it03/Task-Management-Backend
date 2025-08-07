package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.AddedLeaderRequest;
import com.ptithcm.intern_project.dto.request.KickedLeaderRequest;
import com.ptithcm.intern_project.dto.request.PhaseRequest;
import com.ptithcm.intern_project.dto.request.ProjectRequest;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.PhaseResponse;
import com.ptithcm.intern_project.dto.response.ProjectRoleResponse;
import com.ptithcm.intern_project.dto.response.ProjectStatisticResponse;
import com.ptithcm.intern_project.jpa.model.Project;

import java.util.List;

public interface IProjectService {

    IdResponse create(ProjectRequest request, String token);

    void addLeaders(Long projectId, AddedLeaderRequest request, String token);

    void update(Long id, ProjectRequest request, String token);

    void kickLeader(Long id, KickedLeaderRequest request, String token);

    void delete(Long id, String token);

    List<Project> getRelatedProjects(String token);

    List<ProjectRoleResponse> getLeaders(String token, Long id);

    void complete(String token, Long id);

    IdResponse createPhase(Long projectId, PhaseRequest request, String token);

    List<PhaseResponse> getAllRelatedPhases(Long projectId, String token);

    ProjectStatisticResponse getProjectStatistic(String token);

    List<ShortUserInfoDTO> getLeadersToAddIntoProject(Long projectId, String query, String token);
}
