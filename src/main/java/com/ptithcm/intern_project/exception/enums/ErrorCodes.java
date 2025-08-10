package com.ptithcm.intern_project.exception.enums;

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
    INVALID_IDS(10009, "Some Id in list is not existed in Database", BAD_REQUEST),
    INVALID_DATA_FILE(10010, "Invalid data in sent file", BAD_REQUEST),
    INVALID_FILE(10011, "File is crashed, or invalid type!", BAD_REQUEST),
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
    DEPARTMENT_WAS_USED(12002, "Department was used, can not perform action", BAD_REQUEST),
    //--Group(13)
    EMP_CANT_BE_ADMIN(13000, "Employee cannot be an Admin", BAD_REQUEST),
    AT_LEAST_ONE_ADMIN(13001, "Group must has at least one admin", BAD_REQUEST),
    CANT_KICK_YOURSELF(13002, "Cannot kick yourself", BAD_REQUEST),
    USER_NOT_FOUND_ON_GROUP(13003, "User not found on group", BAD_REQUEST),
    //--Task(14)
    INVALID_TASK_START_DATE(14000, "Invalid task start date", BAD_REQUEST),
    INVALID_TASK_DEADLINE(14001, "Invalid task deadline", BAD_REQUEST),
    INVALID_SUB_TASK_START_DATE(14002, "Start date on Sub Task cannot be after Root Task", BAD_REQUEST),
    INVALID_SUB_TASK_DEADLINE(14003, "Deadline on Sub Task cannot be after Root Task", BAD_REQUEST),
    TASK_ENDED(14004, "Cannot change an ended Task", BAD_REQUEST),
    TASK_HASNT_STARTED(14005, "Task has not started yet, cannot perform action", BAD_REQUEST),
    CANNOT_DONE_TASK(14006, "There are Reports still not approved, check Task again", BAD_REQUEST),
    AT_LEAST_ONE_REPORT_ON_TASK(14007, "At least 1 Report existing on Task, cannot perform action", BAD_REQUEST),
    TASK_CREATED_IN_LENGTHY_TIME(14008, "Task has been created in a lengthy time, cannot perform action", BAD_REQUEST),
    //--Report(15)
    REPORT_REVIEWED(15000, "Report has been reviewed, cannot perform action", BAD_REQUEST),
    //--Project(16)
    PROJECT_WAS_CLOSED(16000, "Project was closed, cannot perform action", BAD_REQUEST),
    START_BEFORE_PROJECT(16001, "Cannot start before Project", BAD_REQUEST),
    END_AFTER_PROJECT(16002, "Cannot end after Project", BAD_REQUEST),
    //--Phase(17)
    CANT_DELETE_PHASE(17000, "Phase has already had Collection, cannot perform action", BAD_REQUEST),
    START_BEFORE_PHASE(17001, "Cannot start before Phase", BAD_REQUEST),
    END_AFTER_PHASE(17002, "Cannot end after Phase", BAD_REQUEST),
    //--UserInfo(18)
    INVALID_EMAIL(18000, "Email not found or is invalid", BAD_REQUEST),
    //--Collection(18)
    CANT_DELETE_COLLECTION_WITH_TASKS(18000, "Collection still has tasks, cannot be deleted", BAD_REQUEST),
    CANT_DELETE_PHASE_WITH_COLLECTION(18001, "Phase still has collections, cannot be deleted", BAD_REQUEST),
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
