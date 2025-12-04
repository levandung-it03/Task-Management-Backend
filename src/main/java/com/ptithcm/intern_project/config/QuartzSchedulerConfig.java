package com.ptithcm.intern_project.config;

import org.quartz.JobDetail;
import org.quartz.Trigger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

import java.util.List;

@Configuration
public class QuartzSchedulerConfig {

    @Bean
    public SpringBeanJobFactory springBeanJobFactory(ApplicationContext applicationContext) {
        var jobFactory = new SpringBeanJobFactory();
        jobFactory.setApplicationContext(applicationContext);
        return jobFactory;
    }

    @Bean
    public SchedulerFactoryBean schedulerFactoryBean(
        SpringBeanJobFactory jobFactory,
        List<Trigger> triggers,
        List<JobDetail> jobDetails
    ) {
        var factory = new SchedulerFactoryBean();
        factory.setJobFactory(jobFactory);
        factory.setTriggers(triggers.toArray(new Trigger[0]));
        factory.setJobDetails(jobDetails.toArray(new JobDetail[0]));
        return factory;
    }
}
