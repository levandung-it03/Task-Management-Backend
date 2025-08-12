package com.ptithcm.intern_project.exception.enums;

import com.ptithcm.intern_project.exception.AppExc;
import com.ptithcm.intern_project.jpa.model.Collection;
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
    INVALID_SUB_TASK_START_DATE(14002, "Start-Date on Sub-Task cannot be AFTER Root-Task", BAD_REQUEST),
    INVALID_SUB_TASK_DEADLINE(14003, "Deadline on Sub-Task cannot be AFTER Root-Task", BAD_REQUEST),
    TASK_ENDED(14004, "Task was ended! You cannot do anything more!", BAD_REQUEST),
    TASK_HASNT_STARTED(14005, "Task has not started yet, cannot perform action", BAD_REQUEST),
    CANNOT_DONE_TASK(14006, "Approve all Reports before completing Task!", BAD_REQUEST),
    EXISTS_REPORT_ON_TASK(14007, "Existing Report on Task, cannot perform action", BAD_REQUEST),
    TASK_CREATED_IN_LENGTHY_TIME(14008, "Task has been created in a lengthy time, cannot perform action", BAD_REQUEST),
    START_BEFORE_COLLECTION(14009, "Start-Date must be after Collection Start-Date", BAD_REQUEST),
    END_AFTER_COLLECTION(14009, "End-Date must be before Collection Start-Date", BAD_REQUEST),
    USER_SUBMITTED_REPORT(14010, "User submitted Report on Root-Task, cannot move them", BAD_REQUEST),
    START_BEFORE_ROOT_TASK(14011, "Start-Date must be after Root-Task Start-Date", BAD_REQUEST),
    END_AFTER_ROOT_TASK(14011, "End-Date must be before Root-Task End-Date", BAD_REQUEST),
    //--Report(15)
    REPORT_REVIEWED(15000, "Report has been reviewed, cannot perform action", BAD_REQUEST),
    //--Project(16)
    PROJECT_WAS_CLOSED(16000, "Project was closed, cannot perform action", BAD_REQUEST),
    START_BEFORE_PROJECT(16001, "Start-Date must be after Project Start-Date", BAD_REQUEST),
    END_AFTER_PROJECT(16002, "End-Date must be before Project End-Date", BAD_REQUEST),
    CANT_DELETE_PROJECT_WITH_PHASE(16003, "Project still has phases, cannot be deleted", BAD_REQUEST),
    PROJECT_IS_NOT_IN_PROGRESS(16004, "Project is not in progress, cannot perform action", BAD_REQUEST),
    CANT_COMPLETE_PROJECT(16005, "Complete all Phases before completing Project" , BAD_REQUEST ),
    START_AFTER_PHASE(16006, "Start-Date cannot be AFTER Phase Start-Date", BAD_REQUEST),
    END_BEFORE_PHASE(16007, "End-Date cannot be BEFORE Phase End-Date", BAD_REQUEST),
    START_AFTER_SUB_TASK(16008, "Start-Date cannot be AFTER Sub-Task" , BAD_REQUEST),
    END_BEFORE_SUB_TASK(17008, "End-Date cannot be BEFORE Sub-Task", BAD_REQUEST),
    //--Phase(17)
    CANT_DELETE_PHASE(17000, "Phase has already had Collection, cannot perform action", BAD_REQUEST),
    START_BEFORE_PHASE(17001, "Start-Date must be after Phase Start-Date", BAD_REQUEST),
    END_AFTER_PHASE(17002, "End-Date must be before Phase Start-Date", BAD_REQUEST),
    CANT_DELETE_PHASE_WITH_COLLECTION(17003, "Phase still has collections, cannot be deleted", BAD_REQUEST),
    CANT_COMPLETE_PHASE(17004, "Complete all Collections before completing Phase!", BAD_REQUEST),
    PHASE_ENDED(17005, "Phase was ended! You cannot do anything more!", BAD_REQUEST),
    START_AFTER_COLLECTION(17006,"Start-Date cannot be AFTER Collection Start-Date", BAD_REQUEST),
    END_BEFORE_COLLECTION(17007,"End-Date cannot be BEFORE Collection End-Date", BAD_REQUEST),
    //--UserInfo(18)
    INVALID_EMAIL(18000, "Email not found or is invalid", BAD_REQUEST),
    //--Collection(18)
    CANT_DELETE_COLLECTION_WITH_TASKS(18000, "Collection still has tasks, cannot be deleted", BAD_REQUEST),
    CANT_COMPLETE_COLLECTION(18001, "Complete all Tasks before completing Collection", BAD_REQUEST),
    COLLECTION_ENDED(18002, "Collection was ended! You cannot do anything more!", BAD_REQUEST),
    START_AFTER_TASK(18003,"Start-Date cannot be AFTER Task Start-Date", BAD_REQUEST),
    END_BEFORE_TASK(18004,"End-Date cannot be BEFORE Task End-Date", BAD_REQUEST),
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
