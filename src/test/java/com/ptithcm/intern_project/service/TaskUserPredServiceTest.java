package com.ptithcm.intern_project.service;

import com.ptithcm.intern_project.model.Report;
import com.ptithcm.intern_project.model.Task;
import com.ptithcm.intern_project.model.TaskForUsers;
import com.ptithcm.intern_project.model.UserInfo;
import com.ptithcm.intern_project.repository.interf.TaskUserPredRepository;
import com.ptithcm.intern_project.service.interf.TaskUserPredService;
import com.ptithcm.intern_project.util.DateTimeUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@ExtendWith(MockitoExtension.class)
class TaskUserPredServiceTest {

    @Mock
    TaskUserPredRepository taskUserPredRepository;

    @InjectMocks
    TaskUserPredService taskUserPredService;

    @Test
    void queueNewRecord_mustPass_withValidReportSubmission() {
        var report = getReport();
        taskUserPredService.queueNewRecord(report);
        verify(taskUserPredRepository, times(1)).save(any());
    }

    public Report getReport() {
        return Report.builder()
            .id(4L)
            .updatedTime(DateTimeUtil.stringToLocalDateTime("2025-10-15 01:00:00.000"))
            .userTaskCreated(TaskForUsers.builder()
                .assignedUser(UserInfo.builder()
                    .id(3L)
                    .build())
                .task(Task.builder()
                    .createdTime(DateTimeUtil.stringToLocalDateTime("2025-10-14 10:00:00.000"))
                    .deadline(DateTimeUtil.stringToLocalDate("2025-10-15"))
                    .build())
                .build())
            .build();
    }
}
