package com.ptithcm.intern_project.common.exception;

import com.ptithcm.intern_project.common.enums.ErrorCodes;
import com.ptithcm.intern_project.common.wrappers.ApiResponseObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Objects;

@Slf4j
@ControllerAdvice
@RequiredArgsConstructor
public class CustomExceptionHandler {

    @ExceptionHandler(value = HttpMessageNotReadableException.class)
    public ResponseEntity<ApiResponseObject<Void>> handleUnawareException(HttpMessageNotReadableException exception) {
        if (Objects.isNull(exception.getCause())) {
            var response = ApiResponseObject.fromErr(ErrorCodes.UNAWARE_ERROR, exception.getMessage());
            log.info("[HANDLER]_HttpMessageNotReadableException: {}", exception.getMessage());
            return response;
        }
        var extractedErr = exception.getCause().toString().split(": ");
        var err = new StringBuilder(extractedErr[extractedErr.length - 1]);
        var fieldName = err.substring(err.indexOf("[\"") + 2, err.indexOf("\"]"));  //--Remove quotes.
        var response = ApiResponseObject.fromErr(
            ErrorCodes.PARSE_JSON_ERR,
            ErrorCodes.PARSE_JSON_ERR.getMsg().replace("${field}", fieldName)
        );
        log.info("[HANDLER]_HttpMessageNotReadableException: {}", exception.getMessage());
        return response;
    }

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponseObject<Void>> handleHibernateValidatorException(
        MethodArgumentNotValidException exception) {
        var plainErr = exception.getMessage().split(";")[0];
        var startInd = plainErr.indexOf("field '") + 7;
        var endInd = plainErr.indexOf("'", startInd);
        var response = ApiResponseObject.fromErr(
            ErrorCodes.VALIDATOR_ERR_RESPONSE,
            ErrorCodes.VALIDATOR_ERR_RESPONSE.getMsg().replace("${field}", plainErr.substring(startInd, endInd)));
        log.info("[HANDLER]_ValidatorException: {}", plainErr);
        return response;
    }

    @ExceptionHandler(ApplicationException.class)
    public ResponseEntity<ApiResponseObject<Void>> handleApplicationException(ApplicationException e) {
        ErrorCodes err = e.getErrorEnum();
        log.info("[HANDLER]_ApplicationException: {}", err);
        return ApiResponseObject.fromErr(err);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponseObject<Void>> handleGlobalException(Exception e) {
        log.info("[HANDLER]_Exception: {}", e.getMessage());
        return ApiResponseObject.fromErr(ErrorCodes.UNAWARE_ERROR);
    }
}
