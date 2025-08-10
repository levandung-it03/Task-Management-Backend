package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.dto.general.AccountCreationDTO;
import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.exception.enums.ErrorCodes;
import com.ptithcm.intern_project.security.enums.AuthorityEnum;
import com.ptithcm.intern_project.security.service.OtpHelper;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class AccountMapper {

    /**
     * @param infoRow as {@code Object[] = {email,fullName,identity,phone,role,departmentId}}
     * @return {@code RegisterRequest}
     */
    public AccountCreationDTO toRegisterRequest(Object[] infoRow) {
        try {
            var email = infoRow[0].toString();
            return AccountCreationDTO.builder()
                .username(this.generateUsername(email))
                .password(OtpHelper.randCharacters(12))
                .email(email)
                .fullName(infoRow[1].toString().trim())
                .identity(infoRow[2].toString().trim())
                .phone(infoRow[3].toString().trim())
                .authority(AuthorityEnum.valueOf(infoRow[4].toString().trim()))
                .departmentId((long) Double.parseDouble(infoRow[5].toString().trim()))
                .build();
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.INVALID_DATA_FILE);
        }
    }

    private String generateUsername(String email) {
        var nowDate = LocalDate.now();
        return String.format("%s-%02d%02d%s",
            email.split("@")[0],
            nowDate.getDayOfMonth(),
            nowDate.getMonthValue(),
            String.valueOf(nowDate.getYear()).substring(2)
        );
    }
}
