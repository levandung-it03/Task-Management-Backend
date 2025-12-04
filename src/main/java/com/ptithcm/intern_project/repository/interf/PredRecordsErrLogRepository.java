package com.ptithcm.intern_project.repository.interf;

import com.ptithcm.intern_project.model.interf.PredRecordsErrLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PredRecordsErrLogRepository extends JpaRepository<PredRecordsErrLog, String> {
}
