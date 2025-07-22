package com.ptithcm.intern_project.common.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.*;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum ErrorCodes {
    UNAWARE_ERROR(10000, "Unaware Exc Thrown from server", INTERNAL_SERVER_ERROR),
    VALIDATOR_ERR_RESPONSE(10001, "Invalid data or format of '${field}'", BAD_REQUEST),
    PARSE_JSON_ERR(10002, "Invalid data or format of '${field}'", BAD_REQUEST),
    INVALID_TOKEN(10003, "Auth Token is invalid", UNAUTHORIZED),
    EXPIRED_TOKEN(10004, "Auth Token is expired", UNAUTHORIZED),
    KILLED_TOKEN(10005, "Auth Token was killed", BAD_REQUEST),
    EXPIRED_SESSION(10006, "Session is expired, please login again", UNAUTHORIZED),
    WEIRD_ENUM(10007, "Enum value is invalid", BAD_REQUEST),
    INVALID_ID(10008, "Id is not existed in Database", BAD_REQUEST),
    //--Account(11)
    FORBIDDEN_USER(11000, "User not found or access denied", FORBIDDEN),
    INVALID_CREDENTIALS(11001, "Invalid Credentials", BAD_REQUEST),
    SENDING_EMAIL(11002, "An error thrown when sending email", BAD_REQUEST),
    WEIRD_TOKEN_SUBJECT(11003, "Subject from token is weird", BAD_REQUEST),
    EMAIL_NOT_FOUND(11004, "Email not found", BAD_REQUEST),
    OTP_HAS_NOT_EXPIRED(11005, "OTP has not expired yet", BAD_REQUEST ),
    OTP_TYPE_NOT_FOUND(11006, "OTP type not found", BAD_REQUEST),
    DUPLICATED_EMAIL(11007, "Registered email already exists", BAD_REQUEST),
    OTP_NOT_FOUND(11008, "OTP not found or is expired", BAD_REQUEST),
    OTP_NOT_CORRECT(11009, "OTP is not correct", BAD_REQUEST),
    OAUTH2_PERMISSION(11010, "Third Party Account prevents many required info", BAD_REQUEST),
    //--Department(12)
    DEPARTMENT_NOT_FOUND(12000, "Department not found", BAD_REQUEST),
    DEPARTMENT_ALREADY_EXISTS(12001, "Department already exists", BAD_REQUEST),
    ;
    int code;
    String msg;
    HttpStatus status;
    ErrorCodes(int code, String msg, HttpStatus status) {
        this.code = code;
        this.msg = msg;
        this.status = status;
    }
}
