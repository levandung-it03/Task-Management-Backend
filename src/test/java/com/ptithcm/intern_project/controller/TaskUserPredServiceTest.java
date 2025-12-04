package com.ptithcm.intern_project.controller;

import com.ptithcm.intern_project.model.Report;
import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.service.interf.interfaces.ITaskUserPredService;
import com.ptithcm.intern_project.util.DateTimeUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TaskUserPredServiceTest {
    @Autowired
    ITaskUserPredService taskUserPredService;

    @Test
    public void queueNewRecord_mustPass_withValidReportSubmission() {
        taskUserPredService.queueNewRecord(this.getReport());
    }

    public Report getReport() {
        return Report.builder()
            .updatedTime(DateTimeUtil.stringToLocalDateTime("2025-10-16 10:00:00.000"))
            .userTaskCreated(TaskForUsers.builder()
                .assignedUser(UserInfo.builder()
                    .id(3L)
                    .build())
                .task(Task.builder()
                    .createdTime(DateTimeUtil.stringToLocalDateTime("2025-10-14 10:00:00.000"))
                    .deadline(DateTimeUtil.stringToLocalDate("2025-10-17"))
                    .build())
                .build())
            .build();
    }
}
