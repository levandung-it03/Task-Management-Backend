package com.ptithcm.intern_project.service.messages;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum CommentOfReportMsg {
    REPLIED_COMMENT("Comment Replied of Report on %s", """
        <div>
            <p style="font-size: 18px">Your comment has been replied by <b>%s</b>!</p>
            <div><span>Report Owner: <b>%s</b></span></div>
            <div><span>Report: <b>%s</b></span></div>
            <div><span>Task: <b>%s</b></span></div>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    CREATED_COMMENT("Had Comment of Report on %s", """
        <div>
            <p style="font-size: 18px">Your Report had a comment by <b>%s</b>!</p>
            <div><span>Report Owner: <b>%s</b></span></div>
            <div><span>Report: <b>%s</b></span></div>
            <div><span>Task: <b>%s</b></span></div>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    ;
    String subject;
    String template;

    public String format(Object... args) {
        return String.format(template, args);
    }
}
