package com.ptithcm.intern_project.config;

import com.ptithcm.intern_project.common.enums.AuthorityEnum;
import com.ptithcm.intern_project.dataJpa.entities.Account;
import com.ptithcm.intern_project.dataJpa.entities.Authority;
import com.ptithcm.intern_project.dataJpa.entities.UserInfo;
import com.ptithcm.intern_project.redis.redis_cruds.*;
import com.ptithcm.intern_project.dataJpa.repositories.AccountRepository;
import com.ptithcm.intern_project.dataJpa.repositories.AuthorityRepository;
import com.ptithcm.intern_project.dataJpa.repositories.UserInfoRepository;
import jakarta.transaction.Transactional;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class InitializationDataConfig implements CommandLineRunner {
    AccountRepository accountRepository;
    PasswordEncoder userPasswordEncoder;
    InvalidTokenCrud invalidTokenCrud;
    RefreshTokenCrud refreshTokenCrud;
    UserInfoRepository userInfoRepository;
    AuthorityRepository authorityRepository;
    RegisterOtpCrud registerOtpCrud;
    LostPassOtpCrud lostPassOtpCrud;
    ChangePassOtpCrud changePassOtpCrud;

    @Override
    @Transactional
    public void run(String... args) {
        if (authorityRepository.count() == 0) {
            List<Authority> authorities = authorityRepository.saveAll(List.of(
                Authority.builder().authorityName(AuthorityEnum.ROLE_ADMIN.toString()).build(),
                Authority.builder().authorityName(AuthorityEnum.ROLE_PM.toString()).build(),
                Authority.builder().authorityName(AuthorityEnum.ROLE_LEAD.toString()).build(),
                Authority.builder().authorityName(AuthorityEnum.ROLE_EMP.toString()).build()
            ));
            List<Account> accounts = accountRepository.saveAll(List.of(
                Account.builder()
                    .username("admin@gmail.com")
                    .password(userPasswordEncoder.encode("123123"))
                    .authorities(List.of(authorities.getFirst()))
                    .createdTime(LocalDateTime.now())
                    .active(true)
                    .build(),
                Account.builder()
                    .username("pm@gmail.com")
                    .password(userPasswordEncoder.encode("123123"))
                    .authorities(List.of(authorities.get(1)))
                    .createdTime(LocalDateTime.now())
                    .active(true)
                    .build(),
                Account.builder()
                    .username("lead@gmail.com")
                    .password(userPasswordEncoder.encode("123123"))
                    .authorities(List.of(authorities.get(2)))
                    .createdTime(LocalDateTime.now())
                    .active(true)
                    .build(),
                Account.builder()
                    .username("emp@gmail.com")
                    .password(userPasswordEncoder.encode("123123"))
                    .authorities(List.of(authorities.getLast()))
                    .createdTime(LocalDateTime.now())
                    .active(true)
                    .build(),
                Account.builder()
                    .username("thanhlongphong647@gmail.com")
                    .password(userPasswordEncoder.encode("123123"))
                    .authorities(List.of(authorities.getLast()))
                    .createdTime(LocalDateTime.now())
                    .active(true)
                    .build()
            ));
            userInfoRepository.saveAll(List.of(
                UserInfo.builder()
                    .account(accounts.getFirst())
                    .fullName("IT Admin").build(),
                UserInfo.builder()
                    .account(accounts.get(1))
                    .fullName("Hải PM").build(),
                UserInfo.builder()
                    .fullName("Le Van Dung")
                    .dob(LocalDate.of(2003, 12, 11))
                    .account(accounts.get(2)).build(),
                UserInfo.builder()
                    .fullName("Lê Văn Dũng")
                    .dob(LocalDate.of(2003, 12, 11))
                    .account(accounts.get(3)).build(),
                UserInfo.builder()
                    .fullName("Dũng Lê Văn")
                    .dob(LocalDate.of(2003, 12, 11))
                    .account(accounts.getLast()).build()
            ));
        }
        invalidTokenCrud.deleteAll();
        refreshTokenCrud.deleteAll();
        registerOtpCrud.deleteAll();
        lostPassOtpCrud.deleteAll();
        changePassOtpCrud.deleteAll();
    }
}
