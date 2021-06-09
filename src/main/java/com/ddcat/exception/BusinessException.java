package com.ddcat.exception;

import lombok.Getter;

/**
 * 业务异常
 *
 * @author dd-cat
 */
@Getter
public class BusinessException extends RuntimeException {
    private Integer code;

    private String message;

    public BusinessException(String message) {
        this.message = message;
    }

    public BusinessException(String message, Integer code) {
        this.message = message;
        this.code = code;
    }

    public BusinessException(String message, Throwable e) {
        super(message, e);
        this.message = message;
    }
}
