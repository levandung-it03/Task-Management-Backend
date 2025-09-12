package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.dto.request.PaginationRequest;
import com.ptithcm.intern_project.model.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.model.dto.response.PaginationResponse;
import com.ptithcm.intern_project.model.dto.response.UserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.UserOverviewResponse;
import com.ptithcm.intern_project.model.UserInfo;

import java.util.List;

public interface IUserInfoService {

    UserInfo getUserInfo(String token);

    void updateUserInfo(String token, UpdatedUserInfoRequest dto);

    List<ShortUserInfoDTO> fastSearchUsers(String query, String token);

    List<ShortUserInfoDTO> leadFastSearchUsersForNewTask(String query, String token);

    List<ShortUserInfoDTO> pmFastSearchUsersForNewProject(String query, String token);

    UserOverviewResponse getUserOverview(String email);

    PaginationResponse<UserInfoResponse> searchFullPaginatedInformationUsers(PaginationRequest request);

    void switchAccountStatus(Long userInfoId);
}
