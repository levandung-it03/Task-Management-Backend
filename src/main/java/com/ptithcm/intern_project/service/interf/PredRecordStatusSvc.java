package com.ptithcm.intern_project.service.interf;

import com.ptithcm.intern_project.model.interf.PredRecordsErrLog;
import com.ptithcm.intern_project.repository.interf.PredRecordsErrLogRepository;
import com.ptithcm.intern_project.service.interf.interfaces.IPredRecordStatusSvc;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PredRecordStatusSvc implements IPredRecordStatusSvc {
    PredRecordsErrLogRepository predRecordStsRepo;

    @Override
    public void save(PredRecordsErrLog recordStatus) {
        predRecordStsRepo.save(recordStatus);
    }

    @Override
    public void saveAll(List<PredRecordsErrLog> recordStatuses) {
        predRecordStsRepo.saveAll(recordStatuses);
    }
}
