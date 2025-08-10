package com.ptithcm.intern_project.service.messages;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum AccountMsg {
    GENERAL_OTP_MSG("OTP from %s", """
        <div>
            <p style="font-size: 18px">This information is <b>PRIVATE</b> so that do not show it to anyone</p>
            <h2>Account: <b>%s</b></h2>
            <h2>OTP: <b>%s</b></h2>
        </div>
    """),
    REGISTER_OTP_MSG("Register OTP from %s", GENERAL_OTP_MSG.getTemplate()),
    NEW_PASS_OTP_MSG("New Password OTP from %s", GENERAL_OTP_MSG.getTemplate()),
    LOST_PASS_OTP_MSG("New Password OTP from %s", GENERAL_OTP_MSG.getTemplate()),
    AUTH_EMAIL_OTP_MSG("Authorizing Email OTP from %s", GENERAL_OTP_MSG.getTemplate()),
    STATUS_UPDATED_TRUE("Account %s Updated", "Your Account has been inactive again"),
    STATUS_UPDATED_FALSE("Account %s Updated", "Your Account has been disabled"),
    ;
    String subject;
    String template;

    public String format(Object... args) {
        return String.format(template, args);
    }
}
