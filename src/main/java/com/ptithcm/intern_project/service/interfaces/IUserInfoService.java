package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.jpa.model.UserInfo;

import java.util.List;

public interface IUserInfoService {

    UserInfo getUserInfo(String token);

    void updateUserInfo(String token, UpdatedUserInfoRequest dto);

    List<ShortUserInfoDTO> fastSearchUsers(String query, String token);

    List<ShortUserInfoDTO> leadFastSearchUsersForNewTask(String query, String token);

    List<ShortUserInfoDTO> pmFastSearchUsersForNewProject(String query, String token);
}
