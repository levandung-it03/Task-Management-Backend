package com.ptithcm.intern_project.service.email;

import com.ptithcm.intern_project.model.dto.general.EmailTaskDTO;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

@Service
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class EmailQueueService {
    EmailService emailService;
    Queue<EmailTaskDTO> queue = new ConcurrentLinkedQueue<>();

    public EmailQueueService(EmailService emailService) {
        this.emailService = emailService;
    }

    public void addToQueue(EmailTaskDTO request) {
        queue.add(request);
    }

    @Scheduled(fixedRate = 5_000)
    public void processQueue() {
        EmailTaskDTO request;
        while ((request = queue.poll()) != null) {
            try {
                emailService.sendSimpleEmail(request);
            } catch (Exception e) {
                log.error("Failed to send email to: {}", request.getTo());
            }
        }
    }
}
