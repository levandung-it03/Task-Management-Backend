package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.common.mapper.UserInfoMapper;
import com.ptithcm.intern_project.dto.general.ShortUserInfoDTO;
import com.ptithcm.intern_project.jpa.model.Task;
import com.ptithcm.intern_project.jpa.model.TaskForUsers;
import com.ptithcm.intern_project.jpa.model.enums.UserTaskStatus;
import com.ptithcm.intern_project.jpa.repository.TaskForUsersRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TaskForUsersService {
    TaskForUsersRepository taskForUsersRepository;
    UserInfoMapper userInfoMapper;
    UserInfoService userInfoService;
    JwtService jwtService;

    @Transactional(rollbackFor = RuntimeException.class)
    public List<ShortUserInfoDTO> searchUsersOfRootToCreateSubTask(Long taskId, String query, String tokenOwner) {
        var username = jwtService.readPayload(tokenOwner).get("sub");
        return taskForUsersRepository.fastSearchUsers(taskId, query, username)
            .stream().map(userInfoMapper::shortenUserInfo)
            .toList();
    }

    @Transactional(rollbackFor = RuntimeException.class, propagation = Propagation.REQUIRED)
    public ArrayList<TaskForUsers> saveAllByEmails(List<String> emails, Task task) {
        var savedRelationships = new ArrayList<>(
            userInfoService.findAllByEmailIn(emails)
            .stream().map(user -> TaskForUsers.builder()
                .task(task)
                .userTaskStatus(UserTaskStatus.JOINED)
                .updatedTime(LocalDateTime.now())
                .assignedUser(user)
                .build()
            ).toList()
        );
        task.setTaskForUsers(savedRelationships);
        return savedRelationships;
    }

    public void deleteAll(ArrayList<TaskForUsers> taskForUsers) {
        taskForUsersRepository.deleteAll(taskForUsers);
    }

    public void saveAll(ArrayList<TaskForUsers> restUsersOfRootTask) {
        taskForUsersRepository.saveAll(restUsersOfRootTask);
    }

    public void save(TaskForUsers newUserTask) {
        taskForUsersRepository.save(newUserTask);
    }

    public List<ShortUserInfoDTO> getAllUsersOfTask(Long taskId) {
        return taskForUsersRepository.findAllByTaskId(taskId)
            .stream().map(userTask -> userInfoMapper.shortenUserInfo(userTask.getAssignedUser()))
            .toList();
    }

    public Optional<Task> findByRootIdAndAssignedUsername(Long rootTaskId, String username) {
        return taskForUsersRepository.findByRootIdAndAssignedUsername(rootTaskId, username);
    }

    public List<Task> findAllByRootTaskId(Long rootTaskId) {
        return taskForUsersRepository.findAllByRootTaskId(rootTaskId);
    }

    public List<TaskForUsers> searchRootTaskUsers(Long rootId, String query, String username) {
        return taskForUsersRepository.searchTheRestUsersOnRoot(rootId, query, username);
    }
}
