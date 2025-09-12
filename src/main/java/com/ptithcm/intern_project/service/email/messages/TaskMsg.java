package com.ptithcm.intern_project.service.email.messages;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public enum TaskMsg {
    ASSIGNED_TO_TASK("Assigned Task on %s", """
        <div>
            <p style="font-size: 18px">You have been assigned to a Task <b>%s</b></p>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    MOVED_TO_SUB_TASK("Moved to Sub Task on %s", """
        <div>
            <p style="font-size: 18px">You have been moved to a Sub Task <b>%s</b></p>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    UPDATED_TASK_DESC("Updated Description of Task on %s", """
        <div>
            <p style="font-size: 18px">Description of Task <b>%s</b> has been updated, please check it!</p>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    UPDATED_TASK_REPORT_FORMAT("Updated Report Format of Task on %s", """
        <div>
            <p style="font-size: 18px">Description of Task <b>%s</b> has been updated, please check it!</p>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    COMPLETED_TASK("Marked Task as Completed on %s", """
        <div>
            <p style="font-size: 18px">Task <b>%s</b> has been marked as completed by the Owner!</p>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    LOCKED_TASK("Locked Task on %s", """
        <div>
            <p style="font-size: 18px">Task <b>%s</b> has been Locked by the Owner!</p>
            <div><span>Collection: <b>%s</b></span></div>
            <div><span>Phase: <b>%s</b></span></div>
            <div><span>Project: <b>%s</b></span></div>
        </div>
    """),
    DELETED_TASK("Deleted Task on %s", """
        <div>
            <p style="font-size: 18px">Task <b>%s</b> has been Deleted by the Owner!</p>
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
