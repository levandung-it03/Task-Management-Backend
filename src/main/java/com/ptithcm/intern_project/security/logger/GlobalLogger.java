package com.ptithcm.intern_project.security.logger;

import com.ptithcm.intern_project.security.enums.Loggers;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Service
public class GlobalLogger {

    public void success(HttpServletRequest request, String message, Object... args) {
        this.info(request, message, Loggers.SUCCESS, args);
    }

    public void weird(HttpServletRequest request, String message, Object... args) {
        this.info(request, message, Loggers.WEIRD, args);
    }

    public void handling(HttpServletRequest request, String message, Object... args) {
        this.info(request, message, Loggers.HANDLING, args);
    }

    public void error(HttpServletRequest request, String message, Object... args) {
        this.info(request, message, Loggers.ERROR, args);
    }

    public void request(HttpServletRequest request, String message, Object... args) {
        this.info(request, message, Loggers.REQUEST, args);
    }

    public void steps(HttpServletRequest request, String message, Object... args) {
        this.info(request, message, Loggers.STEPS, args);
    }

    public void info(HttpServletRequest request, String message, Loggers type, Object... args) {
        var mainMsg = "[" + type.toString() + "]" + String.format(message, args);
        log.info(mainMsg);
    }
}
