package com.ptithcm.intern_project.common.wrapper;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ptithcm.intern_project.common.annotation.Overloads;
import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.enums.SuccessCodes;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.ZoneId;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class RestApiResponse<T> implements Serializable {
    int code;
    String msg;
    int status;
    T body;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    LocalDateTime time;

    public static ResponseEntity<RestApiResponse<Void>> fromErr(ErrorCodes errorEnum, String replacedMsg) {
        var result = new RestApiResponse<Void>();
        result.code = errorEnum.getCode();
        result.msg = replacedMsg;
        result.status = errorEnum.getStatus().value();
        result.time = LocalDateTime.now().atZone(ZoneId.systemDefault()).toLocalDateTime();
        return ResponseEntity.status(result.status).body(result);
    }

    @Overloads
    public static ResponseEntity<RestApiResponse<Void>> fromErr(ErrorCodes errorEnum) {
        return RestApiResponse.fromErr(errorEnum, errorEnum.getMsg());
    }

    public static <T> ResponseEntity<RestApiResponse<T>> fromScs(SuccessCodes successEnum, T body) {
        var result = new RestApiResponse<T>();
        result.code = successEnum.getCode();
        result.msg = successEnum.getMsg();
        result.status = HttpStatus.OK.value();
        result.body = body;
        result.time = LocalDateTime.now().atZone(ZoneId.systemDefault()).toLocalDateTime();
        return ResponseEntity.ok().body(result);
    }

    @Overloads
    public static ResponseEntity<RestApiResponse<Void>> fromScs(SuccessCodes successEnum) {
        return RestApiResponse.fromScs(successEnum, null);
    }
}
