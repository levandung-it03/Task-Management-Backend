package com.ptithcm.intern_project.service.files;

import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.dto.general.AccountCreationDTO;
import com.ptithcm.intern_project.service.files.interfaces.IAccountDataService;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@Service
public class AccountDataService implements IAccountDataService {
    protected String ACCOUNT_INFO_CREATION_EX_FILE;
    protected String CREATED_ACCOUNTS_TEMP_FILE;
    protected int EXPIRED_CACHED_ACCOUNTS_MINUTES;
    private ScheduledExecutorService scheduler;

    @PostConstruct
    public void initService() {
        this.scheduler = Executors.newSingleThreadScheduledExecutor();
    }

    @Autowired
    public void setCreatedAccountsTempFile(@Value("${env.data.created-accounts-txt}") String filePath) {
        this.CREATED_ACCOUNTS_TEMP_FILE = filePath;
    }

    @Autowired
    public void setAccountInfoCreationExFile(@Value("${env.data.accounts-creations-exl}") String filePath) {
        this.ACCOUNT_INFO_CREATION_EX_FILE = filePath;
    }

    @Autowired
    public void setAccountInfoCreationExFile(@Value("${env.variables.expired-acc-cache-min}") int minAge) {
        this.EXPIRED_CACHED_ACCOUNTS_MINUTES = minAge;
    }

    public String getCreatedAccountsTempFile() {
        return this.CREATED_ACCOUNTS_TEMP_FILE;
    }

    public String getAccountInfoCreationExFile() {
        return this.ACCOUNT_INFO_CREATION_EX_FILE;
    }

    public int getExpiredCachedAccountsMinutes() {
        return this.EXPIRED_CACHED_ACCOUNTS_MINUTES;
    }

    @Override
    public void saveCreatedAccountsIntoServer(List<AccountCreationDTO> accounts) {
        try (var writer = new FileWriter(CREATED_ACCOUNTS_TEMP_FILE)) {
            var content = new StringBuilder();
            content
                .append("fullName,identity,username,password,authority")
                .append(System.lineSeparator());
            for (AccountCreationDTO account : accounts)
                content
                    .append(account.getFullName()).append(",")
                    .append(account.getIdentity()).append(",")
                    .append(account.getUsername()).append(",")
                    .append(account.getPassword()).append(",")
                    .append(account.getAuthority()).append(System.lineSeparator());
            writer.write(content.toString());
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.INVALID_DATA_FILE);
        }
        scheduler.schedule(this::clearCachedAccountCreation, EXPIRED_CACHED_ACCOUNTS_MINUTES, TimeUnit.MINUTES);
    }

    @Override
    public Resource getAccountCreationExample() {
        try {
            var file = Path.of(ACCOUNT_INFO_CREATION_EX_FILE).toFile();
            return new InputStreamResource(new FileInputStream(file));
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.INVALID_FILE);
        }
    }

    @Override
    public Map<String, Boolean> checkExistsCachedCreatedAccounts() {
        try {
            File file = Path.of(CREATED_ACCOUNTS_TEMP_FILE).toFile();
            Scanner scanner = new Scanner(file);
            return Map.of("result", scanner.hasNext());
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.INVALID_FILE);
        }
    }

    @Override
    public Resource getCachedAccountCreation() {
        try {
            var file = Path.of(CREATED_ACCOUNTS_TEMP_FILE).toFile();
            return new InputStreamResource(new FileInputStream(file));
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.INVALID_FILE);
        }
    }

    @Override
    public void clearCachedAccountCreation() {
        try (var writer = new FileWriter(CREATED_ACCOUNTS_TEMP_FILE)) {
            writer.write("");
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.INVALID_FILE);
        }
    }
}
