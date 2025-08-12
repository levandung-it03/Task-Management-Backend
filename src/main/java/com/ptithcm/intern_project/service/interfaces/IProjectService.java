package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.general.UserStatisticDTO;
import com.ptithcm.intern_project.dto.request.*;
import com.ptithcm.intern_project.dto.response.*;
import com.ptithcm.intern_project.jpa.model.Project;

import java.util.List;
import java.util.Map;

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

    ProjectOverviewResponse getProjectOverview(Long projectId);

    Map<Long, String> getSimplePhases(Long projectId);

    List<UserStatisticDTO> getUsersStatistic(Long projectId);

    ProjectDetailResponse getProjectDetail(Long projectId, String token);

    void startProject(Long projectId, String token);

    void switchPauseAndInProgressProject(Long projectId, String token);

    void closeProject(Long projectId, String token);
}
