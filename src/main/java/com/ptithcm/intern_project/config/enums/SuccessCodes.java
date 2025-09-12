package com.ptithcm.intern_project.config.enums;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum SuccessCodes {
    //--General(20)
    GET_ENUMS(20000, "Get Enums successfully"),
    CREATED(20001, "Created successfully"),
    UPDATED(20002, "Updated successfully"),
    DELETED(20003, "Deleted successfully"),
    GET_DETAIL(20004, "Get data successfully"),
    GET_LIST(20005, "Get the list successfully"),
    //--Account(21)
    AUTHENTICATE(21000, "Login successfully"),
    REGISTER(21001, "Register successfully"),
    GET_OTP(21002, "Send successfully, please check Email"),
    LOST_PASSWORD(21003, "New Password has been sent to Email"),
    REFRESH_TOKEN(21004, "Refresh Token successfully"),
    LOGOUT(21005, "Log-out successfully"),
    CHANGE_PASSWORD(22006, "Change your password successfully"),
    CREATED_ACCOUNTS(22007, "Created successfully! Cached Accounts available in %s, download to see!"),
    //--UserInfo(22)
    GET_USER_INFO(22000, "Get User Info successfully"),
    UPDATE_USER_INFO(22001, "Update your info successfully"),
    //--Task(23)
    CREATED_TASK(23000, "Task has been created, you can delete it in 12 hours"),
    ;
    int code;
    String msg;
    SuccessCodes(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
