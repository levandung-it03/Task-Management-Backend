package com.ptithcm.intern_project.config.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;
import org.springframework.http.HttpStatus;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum SuccessCodes {
    //--General(20)
    GET_ENUMS(20000, "Get Enums successfully", HttpStatus.OK),
    CREATED(20001, "Created successfully", HttpStatus.CREATED),
    UPDATED(20002, "Updated successfully", HttpStatus.OK),
    DELETED(20003, "Deleted successfully", HttpStatus.OK),
    GET_DETAIL(20004, "Get data successfully", HttpStatus.OK),
    GET_LIST(20005, "Get the list successfully", HttpStatus.OK),
    //--Account(21)
    AUTHENTICATE(21000, "Login successfully", HttpStatus.OK),
    REGISTER(21001, "Register successfully", HttpStatus.CREATED),
    GET_OTP(21002, "Send successfully, please check Email", HttpStatus.OK),
    LOST_PASSWORD(21003, "New Password has been sent to Email", HttpStatus.OK),
    REFRESH_TOKEN(21004, "Refresh Token successfully", HttpStatus.OK),
    LOGOUT(21005, "Log-out successfully", HttpStatus.OK),
    CHANGE_PASSWORD(22006, "Change your password successfully", HttpStatus.OK),
    CREATED_ACCOUNTS(22007, "Created successfully! Cached Accounts available in %s, download to see!", HttpStatus.CREATED),
    //--UserInfo(22)
    GET_USER_INFO(22000, "Get User Info successfully", HttpStatus.OK),
    UPDATE_USER_INFO(22001, "Update your info successfully", HttpStatus.OK),
    //--Task(23)
    CREATED_TASK(23000, "Task has been created, you can delete it in 12 hours", HttpStatus.CREATED),
    DELETED_SUB_TASK(23001, "Sub-Task has been deleted, assigned User was back to Task!", HttpStatus.OK),
    REASSIGNED_USERS(23002, "New User added, and the current one has been moved to Task!", HttpStatus.OK),
    //--RecUsersForTask(24)
    EMPTY_USERS(24000, "Employees are busy, or no body meets the demand!", HttpStatus.NO_CONTENT),
    ;
    int code;
    String msg;
    HttpStatus status;
    SuccessCodes(int code, String msg, HttpStatus status) {
        this.code = code;
        this.msg = msg;
        this.status = status;
    }
}
