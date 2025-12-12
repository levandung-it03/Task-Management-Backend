package com.ptithcm.intern_project.mapper;

import com.ptithcm.intern_project.model.dto.general.AccountCreationDTO;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.enums.AuthorityEnum;
import com.ptithcm.intern_project.service.auth.OtpHelper;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.HashMap;

@Component
public class AccountMapper {

    /**
     * @param infoRow as {@code Object[] = {email,fullName,identity,phone,role,departmentId}}
     * @return {@code RegisterRequest}
     */
    public AccountCreationDTO toRegisterRequest(Object[] infoRow, HashMap<String, Integer> colIdxMap) {
        try {
            var email = infoRow[colIdxMap.get("email")].toString();
            return AccountCreationDTO.builder()
                .username(this.generateUsername(email))
                .password(OtpHelper.randCharacters(12))
                .email(email)
                .fullName(infoRow[colIdxMap.get("fullName")].toString().trim())
                .identity(infoRow[colIdxMap.get("identity")].toString().trim())
                .phone(infoRow[colIdxMap.get("phone")].toString().trim())
                .authority(AuthorityEnum.valueOf(infoRow[colIdxMap.get("role")].toString().trim()))
                .departmentId((long) Double.parseDouble(infoRow[colIdxMap.get("departmentId")].toString().trim()))
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
