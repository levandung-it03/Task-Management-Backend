package com.ptithcm.intern_project.services;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.exception.ApplicationException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import java.util.Map;

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
    public void sendSimpleEmail(String to, String subject, String text) throws ApplicationException {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true);

            mimeMessageHelper.setFrom(mailSender);
            mimeMessageHelper.setTo(to);
            mimeMessageHelper.setSubject(subject);
            mimeMessageHelper.setText(text, true);

            javaMailSender.send(message);
        } catch (Exception e) {
            throw new ApplicationException(ErrorCodes.SENDING_EMAIL);
        }
    }

    public Map<String, String> getEmailCustom() {
        return Map.of(
            "msg", """
                <div>
                    <p style="font-size: 18px">This information is <b>PRIVATE</b> so that do not show it to anyone</p>
                    <h2>Account: <b>%s</b></h2>
                    <h2>OTP: <b>%s</b></h2>
                </div>
            """,
            "subject", "%s from " + this.APP_NAME
        );
    }
}