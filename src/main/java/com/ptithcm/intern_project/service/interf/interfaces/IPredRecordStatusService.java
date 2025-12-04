package com.ptithcm.intern_project.service.interf.interfaces;

import com.ptithcm.intern_project.model.interf.PredRecordsErrLog;

import java.util.List;

public interface IPredRecordStatusService {
    void save(PredRecordsErrLog recordStatus);
    void saveAll(List<PredRecordsErrLog> recordStatuses);
}
