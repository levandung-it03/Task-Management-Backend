package com.ptithcm.intern_project.repository.interf;

import com.ptithcm.intern_project.model.interf.TaskUserRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskUserPredRepository extends JpaRepository<TaskUserRecord, Long> {
    List<TaskUserRecord> findAllByWasSent(boolean wasSentStatus);
    int countAllByWasSent(boolean wasSent);
}
