package com.ptithcm.intern_project.service.files.interfaces;

import com.ptithcm.intern_project.model.dto.general.AccountCreationDTO;
import org.springframework.core.io.Resource;

import java.util.List;
import java.util.Map;

public interface IAccountDataService {
    void saveCreatedAccountsIntoServer(List<AccountCreationDTO> accounts);

    Resource getAccountCreationExample();

    Map<String, Boolean> checkExistsCachedCreatedAccounts();

    Resource getCachedAccountCreation();

    void clearCachedAccountCreation();
}
