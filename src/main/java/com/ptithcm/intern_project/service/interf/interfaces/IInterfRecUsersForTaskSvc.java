package com.ptithcm.intern_project.service.interf.interfaces;

import com.ptithcm.intern_project.model.Report;
import com.ptithcm.intern_project.model.dto.request.RecUsersByModelRequest;
import com.ptithcm.intern_project.model.dto.response.UserPredScoreResponse;

import java.util.List;

public interface IInterfRecUsersForTaskSvc {
    void queueNewRecord(Report approvedReport);
    void sendNewRecords();
    int countAllRecordsByWasSent(boolean wasSent);

    List<UserPredScoreResponse> recommendUserIds(RecUsersByModelRequest request);

    void renewModel();
}
