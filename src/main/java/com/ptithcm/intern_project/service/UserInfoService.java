package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.UserInfo;
import com.ptithcm.intern_project.jpa.repository.UserInfoRepository;
import com.ptithcm.intern_project.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.security.service.JwtService;
import com.ptithcm.intern_project.service.interfaces.IUserInfoService;
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
public class UserInfoService implements IUserInfoService {
    UserInfoRepository userInfoRepository;
    JwtService jwtService;
    UserInfoMapper userInfoMapper;

    @Override
    public UserInfo getUserInfo(String token) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        return userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));
    }

    @Override
    public void updateUserInfo(String token, UpdatedUserInfoRequest dto) {
        HashMap<String, String> claims = jwtService.readPayload(token);
        UserInfo originInfo = userInfoRepository.findByAccountUsername(claims.get("sub"))
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_TOKEN));

        originInfo.setFullName(dto.getFullName());
        userInfoRepository.save(originInfo);
    }
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> fastSearchUsers(String query, String token) {
        if (this.isAuthority(token, AuthorityEnum.ROLE_EMP))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var usernameFinding = jwtService.readPayload(token).get("sub");
        return userInfoRepository.findAllByEmailOrFullName(query, query).stream()
            .filter(userInfo -> !userInfo.getAccount().getUsername().equals(usernameFinding))
            .map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> leadFastSearchUsersForNewTask(String query, String token) {
        if (!this.isAuthority(token, AuthorityEnum.ROLE_LEAD))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var usernameFinding = jwtService.readPayload(token).get("sub");
        return userInfoRepository.findAllByEmailOrFullName(query, query).stream()
            .filter(userInfo -> !userInfo.getAccount().getUsername().equals(usernameFinding))
            .map(userInfoMapper::shortenUserInfo)
            .filter(user -> user.getRole().equals(AuthorityEnum.ROLE_EMP.toString()))
            .toList();
    }

    @Override
    public List<ShortUserInfoDTO> pmFastSearchUsersForNewProject(String query, String token) {
        if (!this.isAuthority(token, AuthorityEnum.ROLE_PM))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        return userInfoRepository.findAllByEmailOrFullName(query, query).stream()
            .map(userInfoMapper::shortenUserInfo)
            .filter(user -> user.getRole().equals(AuthorityEnum.ROLE_LEAD.toString()))
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

    public List<UserInfo> findAllByEmailIn(List<String> assignedEmails) {
        return userInfoRepository.findAllByEmailIn(assignedEmails);
    }

    public boolean existsByEmail(String email) {
        return userInfoRepository.existsByEmail(email);
    }

    public Optional<UserInfo> findByEmail(String addedUserEmail) {
        return userInfoRepository.findByEmail(addedUserEmail);
    }
}
