package com.ptithcm.intern_project.service.interf;

import com.ptithcm.intern_project.client.FastAPIClient;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import com.ptithcm.intern_project.model.Report;
import com.ptithcm.intern_project.model.dto.request.RecUsersByModelRequest;
import com.ptithcm.intern_project.model.dto.request.UpdatingTskUsrModelRequest;
import com.ptithcm.intern_project.model.dto.response.RecommendedUserIdsResponse;
import com.ptithcm.intern_project.model.dto.response.UserPredScoreResponse;
import com.ptithcm.intern_project.model.interf.PredRecordsErrLog;
import com.ptithcm.intern_project.model.interf.TaskUserRecord;
import com.ptithcm.intern_project.repository.interf.TaskUserPredRepository;
import com.ptithcm.intern_project.service.interf.interfaces.IInterfRecUsersForTaskSvc;
import com.ptithcm.intern_project.util.DateTimeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class InterfRecUsersForTaskSvc implements IInterfRecUsersForTaskSvc {
    private final TaskUserPredRepository taskUserPredRepo;
    private final PredRecordStatusSvc predRecordStsSvc;
    private final FastAPIClient fastAPIClient;

    @Value("${env.quartz.tsk-usr-pred.save-new-record.min-batch-size}")
    int MIN_BATCH_SIZE;
    @Value("${env.fastapi.controllers.tsk-usr-pred.save-records}") String SAVE_RECORDS_PATH;
    @Value("${env.fastapi.controllers.tsk-usr-pred.users-recommend}") String USERS_RECOMMEND_PATH;
    @Value("${env.fastapi.controllers.tsk-usr-pred.renew-model}") String RENEW_MODEL_PATH;

    @Override
    public void queueNewRecord(Report approvedReport) {
        var task = approvedReport.getUserTaskCreated().getTask();
        var isOnTime = !approvedReport.getUpdatedTime().isAfter(task.getDeadline().plusDays(1).atStartOfDay());

        var record = TaskUserRecord.builder()
            .userId(approvedReport.getUserTaskCreated().getAssignedUser().getId())
            .domain(task.getTaskType())
            .level(task.getLevel())
            .priority(task.getPriority())
            .isOnTime(isOnTime ? 1 : 0)
            .freeTimeRto(this.calcFreeTimeRatio(isOnTime, approvedReport))
            .punctScore(this.calcPunctScore(isOnTime, approvedReport))
            .wasSent(false)
            .build();
        taskUserPredRepo.save(record);

        //--Separated Transaction here.
        var unsentRecords = taskUserPredRepo.countAllByWasSent(false);
        if (unsentRecords >= MIN_BATCH_SIZE)
            this.sendNewRecords();
    }

    private float calcFreeTimeRatio(boolean isOnTime, Report report) {
        if (!isOnTime)  return 0;

        var task = report.getUserTaskCreated().getTask();
        var deadline = task.getDeadline().plusDays(1).atStartOfDay();
        float totalTaskSeconds = Duration.between(task.getUpdatedTime(), deadline).toSeconds();
        float totalFreeSeconds = Duration.between(report.getUpdatedTime(), deadline).toSeconds();
        if (totalFreeSeconds <= 0)  return 0;

        return totalFreeSeconds / totalTaskSeconds;
    }

    private float calcPunctScore(boolean isOnTime, Report report) {
        if (isOnTime)
            return 1;
        var task = report.getUserTaskCreated().getTask();
        var deadline = task.getDeadline().plusDays(1).atStartOfDay();
        float totalTaskSeconds = Duration.between(task.getUpdatedTime(), deadline).toSeconds();
        float totalLateSeconds = Duration.between(deadline, report.getUpdatedTime()).toSeconds();

        return Math.max(0, 1 - totalLateSeconds/totalTaskSeconds);
    }

    @Override
    public void sendNewRecords() {
        var request = UpdatingTskUsrModelRequest.builder()
            .newRecords(taskUserPredRepo.findAllByWasSent(false))
            .build();
        try {
            fastAPIClient.put(SAVE_RECORDS_PATH, request, Void.class);
        } catch (Exception e) {
            var logs = request.getNewRecords().stream()
                .map(record -> PredRecordsErrLog.builder()
                    .reqTimeId(DateTimeUtil.millisecondToStringTime(System.currentTimeMillis()))
                    .record(record)
                    .errLog(e.getMessage())
                    .build())
                .toList();
            predRecordStsSvc.saveAll(logs);
            throw new RuntimeException(e.getMessage());
        }
        taskUserPredRepo.saveAll(request
            .getNewRecords().stream()
            .peek(unsentRecord -> unsentRecord.setWasSent(true))
            .toList());
    }

    @Override
    public int countAllRecordsByWasSent(boolean wasSent) {
        return taskUserPredRepo.countAllByWasSent(wasSent);
    }

    @Override
    public List<UserPredScoreResponse> recommendUserIds(RecUsersByModelRequest request) {
        try {
            return fastAPIClient
                .post(USERS_RECOMMEND_PATH, request, RecommendedUserIdsResponse.class)
                .getTopOrderedUsers();
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new AppExc(ErrorCodes.CANNOT_GET_TOP_USERS);
        }
    }

    @Override
    public void renewModel() {
        try {
            fastAPIClient.put(RENEW_MODEL_PATH, new Object(), Void.class);
        } catch(Exception e) {
            predRecordStsSvc.save(PredRecordsErrLog.builder()
                .reqTimeId(DateTimeUtil.millisecondToStringTime(System.currentTimeMillis()))
                .errLog(e.getMessage())
                .build());
            throw new RuntimeException(e.getMessage());
        }
    }
}
