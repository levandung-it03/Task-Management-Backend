package com.ptithcm.intern_project.config.exception;

import com.ptithcm.intern_project.config.enums.ErrorCodes;
import com.ptithcm.intern_project.model.dto.general.RestApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Objects;

@Slf4j
@ControllerAdvice
@RequiredArgsConstructor
public class CustomExceptionHandler {

    @ExceptionHandler(value = HttpMessageNotReadableException.class)
    public ResponseEntity<RestApiResponse<Void>> handleUnawareException(HttpMessageNotReadableException exception) {
        if (Objects.isNull(exception.getCause())) {
            var response = RestApiResponse.fromErr(ErrorCodes.UNAWARE_ERROR, exception.getMessage());
            log.error("[HANDLER]_HttpMessageNotReadableException: {}", exception.getMessage());
            return response;
        }
        var extractedErr = exception.getCause().toString().split(": ");
        var err = new StringBuilder(extractedErr[extractedErr.length - 1]);
        var fieldName = err.substring(err.indexOf("[\"") + 2, err.indexOf("\"]"));  //--Remove quotes.
        var response = RestApiResponse.fromErr(
            ErrorCodes.PARSE_JSON_ERR,
            ErrorCodes.PARSE_JSON_ERR.getMsg().replace("${field}", fieldName)
        );
        log.error("[HANDLER]_HttpMessageNotReadableException: {}", exception.getMessage());
        return response;
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public ResponseEntity<RestApiResponse<Void>> handleHibernateValidatorException(
        MethodArgumentNotValidException exception) {
        log.error("[HANDLER]_ValidatorException: {}", exception.getMessage());

        FieldError field = exception.getBindingResult().getFieldError();
        if (field == null)
            return RestApiResponse.fromErr(ErrorCodes.VALIDATOR_ERR_RESPONSE, exception.getMessage());

        var fieldName = field.getField();
        var defMsg = exception.getBindingResult().getAllErrors().getFirst().getDefaultMessage();
        if (defMsg == null)
            return RestApiResponse.fromErr(ErrorCodes.VALIDATOR_ERR_RESPONSE, exception.getMessage());

        return RestApiResponse.fromErr(ErrorCodes.VALIDATOR_ERR_RESPONSE, defMsg.replace("${field}", fieldName));
    }

    @ExceptionHandler(AppExc.class)
    public ResponseEntity<RestApiResponse<Void>> handleAppExc(AppExc e) {
        ErrorCodes err = e.getErrorEnum();
        log.error("[HANDLER]_AppExc: {}", err);
        return RestApiResponse.fromErr(err);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<RestApiResponse<Void>> handleGlobalException(Exception e) {
        log.error("[HANDLER]_Exception: {}", e.getMessage());
        e.fillInStackTrace();
        e.printStackTrace();
        return RestApiResponse.fromErr(ErrorCodes.UNAWARE_ERROR);
    }
}
