package com.ptithcm.intern_project.dto.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ptithcm.intern_project.dto.request.PaginationRequest;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.lang.reflect.Field;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UserInfoResponse {
    Long id;
    String fullName;
    String email;
    String department;
    String identity;
    String phone;
    String authorities;
    Boolean status;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    LocalDateTime createdTime;

    public static UserInfoResponse generateFilterObject(PaginationRequest request) {
        UserInfoResponse response = new UserInfoResponse();
        try {
            Field field = UserInfoResponse.class.getDeclaredField(request.getFilterField());
            field.setAccessible(true);

            Class<?> fieldType = field.getType();

            Object castedValue = convertValue(request.getSearchVal(), fieldType);

            field.set(response, castedValue);
        } catch (IllegalAccessException | NoSuchFieldException e) {
            e.printStackTrace();
            e.fillInStackTrace();
        }
        return response;
    }

    private static Object convertValue(String query, Class<?> fieldType)
        throws IllegalArgumentException {
        if (fieldType == Long.class)
            return Long.parseLong(query);
        if (fieldType == String.class)
            return query;
        throw new IllegalArgumentException();
    }
}
