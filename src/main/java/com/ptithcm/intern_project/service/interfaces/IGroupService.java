package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.ChangeGroupStatusRequest;
import com.ptithcm.intern_project.dto.request.GroupRequest;
import com.ptithcm.intern_project.dto.request.PaginationRequest;
import com.ptithcm.intern_project.dto.request.UpdatedGroupRequest;
import com.ptithcm.intern_project.dto.response.DetailGroupResponse;
import com.ptithcm.intern_project.dto.response.GroupResponse;
import com.ptithcm.intern_project.dto.response.IdResponse;
import com.ptithcm.intern_project.dto.response.PaginationResponse;
import com.ptithcm.intern_project.jpa.model.Group;

import java.util.List;

public interface IGroupService {

    PaginationResponse<GroupResponse> getPaginatedGroups(PaginationRequest request, String token);

    IdResponse create(GroupRequest request, String token);

    DetailGroupResponse get(Long id, String token);

    void update(Long id, UpdatedGroupRequest request, String token);

    void changeStatus(Long id, ChangeGroupStatusRequest request, String token);

    List<Group> getRelatedGroups(String token);

    List<ShortUserInfoDTO> getUsersGroupToAssign(String id, String token);
}
