package com.ptithcm.intern_project.service.email.messages;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum ReportMsg {
    UPDATED_REPORT("Report Updated on %s", """
        <div>
            <p style="font-size: 18px">A Report on your Task has been updated, please check it!</p>
            <div><span>Report Owner: <b>%s</b></span></div>
            <div><span>Report: <b>%s</b></span></div>
            <div><span>Task: <b>%s</b></span></div>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    APPROVED_REPORT("Report Approved on %s", """
        <div>
            <p style="font-size: 18px">Your Report has been approved by <b>%s</b>!</p>
            <div><span>Report: <b>%s</b></span></div>
            <div><span>Task: <b>%s</b></span></div>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    REJECTED_REPORT("Report Rejected on %s", """
        <div>
            <p style="font-size: 18px">Your Report has been rejected by <b>%s</b>!</p>
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
