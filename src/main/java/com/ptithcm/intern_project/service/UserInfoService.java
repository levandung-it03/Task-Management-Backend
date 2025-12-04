package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.dto.request.PaginationRequest;
import com.ptithcm.intern_project.model.dto.response.PaginationResponse;
import com.ptithcm.intern_project.model.dto.response.UserInfoResponse;
import com.ptithcm.intern_project.model.dto.response.UserOverviewResponse;
import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.mapper.UserInfoMapper;
import com.ptithcm.intern_project.model.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.repository.UserInfoRepository;
import com.ptithcm.intern_project.model.dto.request.UpdatedUserInfoRequest;
import com.ptithcm.intern_project.service.auth.JwtService;
import com.ptithcm.intern_project.service.interfaces.IUserInfoService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
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

        userInfoMapper.updateUserInfo(originInfo, dto);
        userInfoRepository.save(originInfo);
    }
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> fastSearchUsers(String query, String token) {
        if (this.isAuthority(token, AuthorityEnum.ROLE_EMP))
            throw new AppExc(ErrorCodes.FORBIDDEN_USER);

        var usernameFinding = jwtService.readPayload(token).get("sub");
        return userInfoRepository.findAllByEmailOrFullName(query, query).stream()
            .filter(userInfo -> !(userInfo.getAccount().getUsername().equals(usernameFinding)
                || userInfo.getAccount().getAuthorities().getFirst().getName()
                    .equals(AuthorityEnum.ROLE_ADMIN.toString())))
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

    public List<UserInfo> searchAllLeaderByNotEmailIn(List<String> emails, String query) {
        return userInfoRepository.searchAllLeaderByNotEmailIn(emails, query);
    }

    public List<UserInfo> saveAll(List<UserInfo> usersInfoRequest) {
        return userInfoRepository.saveAll(usersInfoRequest);
    }

    public void save(UserInfo userInfo) {
        userInfoRepository.save(userInfo);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public UserOverviewResponse getUserOverview(String email) {
        var userInfo = userInfoRepository.findByEmail(email).orElseThrow(() -> new AppExc(ErrorCodes.INVALID_EMAIL));
        return userInfoMapper.toOverview(userInfo);
    }

    @Override
    public PaginationResponse<UserInfoResponse> searchFullPaginatedInformationUsers(PaginationRequest request) {
        var pageable = PageRequest.of(
            request.getPage() - 1,
            PaginationService.PAGE_SIZE,
            PaginationService.getSortOption(request, UserInfo.class));
        var filterObject = UserInfoResponse.generateFilterObject(request);
        var usersPage = userInfoRepository.searchFullPaginatedInformationUsers(filterObject, pageable);
        var usersList = usersPage.stream()
            .map(userInfoMapper::toFullInfo)
            .filter(user -> !user.getAuthorities().toUpperCase().contains("ADMIN"))
            .toList();

        return PaginationResponse.<UserInfoResponse>builder()
            .totalPages(usersPage.getTotalPages())
            .dataList(usersList)
            .build();
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public void switchAccountStatus(Long userInfoId) {
        var userInfo = userInfoRepository.findById(userInfoId)
            .orElseThrow(() -> new AppExc(ErrorCodes.INVALID_ID));
        userInfo.getAccount().setStatus(!userInfo.getAccount().isStatus());
        userInfoRepository.save(userInfo);
    }

    public Optional<UserInfo> findByAccountId(Long id) {
        return userInfoRepository.findByAccountId(id);
    }

    public int countAllForModel(String scopes) {
        return userInfoRepository.countAllUsersToRecommend(scopes);
    }

    public List<Long> findAllInactiveUsersByAccount() {
        return userInfoRepository.findAllInactiveUsersByAccount();
    }

    public List<UserInfo> findAllByIdsAndAuthority(List<Long> rankedUserIds, AuthorityEnum authority) {
        return userInfoRepository.findAllByIdsAndAuthority(rankedUserIds, authority.toString());
    }
}
