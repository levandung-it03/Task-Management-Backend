package com.ptithcm.intern_project.service.email.messages;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum GroupMsg {
    ADDED_INTO_GROUP(
        "Added Into Group of %s",
        "<p>You have been added to a new Group <b>%s</b></p>"),
    CHANGED_GROUP_PERMISSION(
        "Group Permission Changed from %s",
        "<p>Your permission on Group <b>%s</b> has been changed, please check it!</p>"),
    KICKED_USER_GROUP(
        "Kicked out of Group from %s",
        "<p>You have been kicked out of Group <b>%s</b></p>"),
    RE_ADDED_USER_GROUP(
        "Re Added into Group from %s",
        "<p>You have been re-added in Group <b>%s</b></p>"),
    ;
    String subject;
    String template;

    public String format(Object... args) {
        return String.format(template, args);
    }
}
