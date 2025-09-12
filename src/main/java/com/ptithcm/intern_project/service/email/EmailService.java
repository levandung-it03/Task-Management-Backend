package com.ptithcm.intern_project.service.email;

import com.ptithcm.intern_project.model.dto.general.EmailTaskDTO;
import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.config.exception.AppExc;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

@Service
@EnableAsync
@RequiredArgsConstructor
public class EmailService {
    @Value("${spring.application.name}")
    private String APP_NAME;
    private final JavaMailSender javaMailSender; //--Injection from configured bean in application.properties
    @Value("${spring.mail.username}")
    private String mailSender;

    @Async("taskExecutor")
    public void sendSimpleEmail(EmailTaskDTO request) throws AppExc {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true);

            mimeMessageHelper.setFrom(mailSender);
            var subject = request.getSubject();
            if (subject.contains("%s"))
                subject = String.format(subject, APP_NAME);
            mimeMessageHelper.setTo(request.getTo());
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(request.getBody(), true);

            javaMailSender.send(message);
        } catch (Exception e) {
            throw new AppExc(ErrorCodes.SENDING_EMAIL);
        }
    }
}