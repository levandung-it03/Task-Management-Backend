package com.ptithcm.intern_project.service.interf.jobs;

import com.ptithcm.intern_project.service.interf.TaskUserPredService;
import lombok.RequiredArgsConstructor;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class IntervalRenewModelJob implements Job {
    private final TaskUserPredService tskUsrPredSvc;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        tskUsrPredSvc.renewModel();
    }
}
