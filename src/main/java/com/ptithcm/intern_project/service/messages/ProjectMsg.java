package com.ptithcm.intern_project.service.messages;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum ProjectMsg {
    ADDED_INTO_PROJECT(
        "Be a Project Member on %s",
        "<p>You have been added as a Member on Project <b>%s</b></p>"),
    UPDATED_PROJECT(
        "Project Updated from %s",
        "<p>Project Manager has updated base information of Project <b>%s</b></p>"),
    KICKED_LEADER(
        "Kicked Out of Project from %s",
        "<p>Project Manager has kicked you out of Project <b>%s</b></p>"),
    COMPLETED_PROJECT(
        "Project Completed on %s",
        "<p>Project Manager has marked Project <b>%s</b></p> as completed"),
    ;
    String subject;
    String template;

    public String format(Object... args) {
        return String.format(template, args);
    }
}
