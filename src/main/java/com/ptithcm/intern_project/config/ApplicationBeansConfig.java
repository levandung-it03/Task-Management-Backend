package com.ptithcm.intern_project.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.ptithcm.intern_project.config.constvalues.BeanNames;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.reactive.function.client.WebClient;

import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;

@Configuration
public class ApplicationBeansConfig {
    @Value("${env.jwt.secret-key}")
    private String SECRET_KEY;

    @Bean
    @Qualifier(BeanNames.FAST_API_WEBCLIENT)
    public WebClient fastApiWebClient(@Value("${env.fastapi.host}") String baseUrl) {
        return WebClient.builder()
            .baseUrl(baseUrl)
            .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
            .build();
    }

    @Bean
    public ObjectMapper objectMapper() {
        var objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        return objectMapper;
    }

    @Bean
    @Primary
    public PasswordEncoder userPasswordEncoder() {
        return new BCryptPasswordEncoder(8, new SecureRandom());
    }

    @Bean
    public PasswordEncoder oauthClientPasswordEncoder() {
        return new BCryptPasswordEncoder(4);
    }

    @Bean
    public SecretKeySpec customKeySpec() {
        return new SecretKeySpec(SECRET_KEY.getBytes(), "HS512");
    }
}
