package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.AppExc;
import com.ptithcm.intern_project.common.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.UserInfoRepository;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class UserInfoService {
    UserInfoRepository userInfoRepository;
    JwtService jwtService;
    UserInfoMapper userInfoMapper;

    public UserInfo getUserInfo(String token) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        return userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
    }

    public void updateUserInfo(String token, UpdatedUserInfoRequest dto) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        UserInfo originInfo = userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        originInfo.setFullName(dto.getFullName());
        originInfo.setDob(dto.getDob());
        userInfoRepository.save(originInfo);
    }

    public List<UserInfo> findAllByEmailIn(List<String> assignedEmails) {
        return userInfoRepository.findAllByEmailIn(assignedEmails);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> fastSearchUsers(String query, String token) {
        if (this.isAuthority(token, AuthorityEnum.ROLE_EMP))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return userInfoRepository.findAllByEmailOrFullName(query, query)
            .stream().map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> leadFastSearchUsersForNewTask(String query, String token) {
        if (!this.isAuthority(token, AuthorityEnum.ROLE_PM))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return userInfoRepository.findAllByEmailOrFullName(query, query).stream()
            .map(userInfoMapper::shortenUserInfo)
            .filter(user -> !user.getRole().equals(AuthorityEnum.ROLE_PM.toString()))
            .toList();
    }

    public boolean isAuthority(String token, AuthorityEnum authority) {
        var userInfo = this.getUserInfo(token);
        return userInfo.getAccount()
            .getAuthorities().getFirst()
            .getAuthority().equals(authority.toString());
    }

    public Optional<UserInfo> findByAccountUsername(String username) {
        return userInfoRepository.findByAccountUsername(username);
    }

    public List<UserInfo> fastSearchUsersIgnoreInRootTask(Long rootTaskId, String query) {
        return userInfoRepository.fastSearchUsersIgnoreInRootTask(rootTaskId, query);
    }

    public boolean existsByDepartmentId(Long id) {
        return userInfoRepository.existsByDepartmentId(id);
    }

    public List<ShortUserInfoDTO> pmFastSearchUsersForNewProject(String query, String token) {
        if (!this.isAuthority(token, AuthorityEnum.ROLE_PM))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return userInfoRepository.findAllByEmailOrFullName(query, query).stream()
            .map(userInfoMapper::shortenUserInfo)
            .filter(user -> user.getRole().equals(AuthorityEnum.ROLE_LEAD.toString()))
            .toList();
    }
}
