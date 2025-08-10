package com.ptithcm.intern_project.service.interfaces;

import com.ptithcm.intern_project.jpa.model.enums.GroupRole;

public interface IGroupHasUsersService {

    void updateGroupRole(Long id, GroupRole role, String token);

    void kickUser(Long id, String token);

    void reAddUser(Long id, String token);
}
