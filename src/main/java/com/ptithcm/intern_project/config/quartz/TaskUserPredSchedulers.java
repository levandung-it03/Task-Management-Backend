package com.ptithcm.intern_project.config.quartz;

import com.ptithcm.intern_project.service.interf.jobs.IntervalRenewModelJob;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaskUserPredSchedulers {
    @Value("${env.quartz.tsk-usr-pred.renew-model.job-name}") String RENEW_MODEL_JOB_NAME;
    @Value("${env.quartz.tsk-usr-pred.renew-model.trigger-name}") String RENEW_MODEL_TRIGGER_NAME;
    @Value("${env.quartz.tsk-usr-pred.renew-model.cron-time}") String RENEW_MODEL_CRON_TIME;

    @Bean
    public JobDetail periodicallyRenewModelDetail() {
        return JobBuilder.newJob(IntervalRenewModelJob.class)
            .withIdentity(RENEW_MODEL_JOB_NAME)
            .storeDurably()
            .build();
    }

    @Bean
    public Trigger periodicallyRenewTrigger() {
        return TriggerBuilder.newTrigger()
            .withIdentity(RENEW_MODEL_TRIGGER_NAME)
            .forJob(periodicallyRenewModelDetail())
            .withSchedule(CronScheduleBuilder.cronSchedule(RENEW_MODEL_CRON_TIME))
            .build();
    }
}
