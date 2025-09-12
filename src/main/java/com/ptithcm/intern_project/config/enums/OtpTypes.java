package com.ptithcm.intern_project.config.enums;

import lombok.Getter;

@Getter
public enum OtpTypes {
    CHANGE_PASSWORD("changePassword"),
    LOST_PASSWORD("lostPassword"),
    REGISTER("register"),
    ;
    private final String name;
    OtpTypes(String name) {
        this.name = name;
    }
    public static boolean exists(String name) {
        for (OtpTypes t : OtpTypes.values())
            if (t.toString().equals(name))
                return true;
        return false;
    }
}
