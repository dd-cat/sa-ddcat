package com.ddcat.handler;

import cn.dev33.satoken.exception.NotLoginException;
import com.ddcat.entity.common.Result;
import com.ddcat.exception.BusinessException;
import com.ddcat.menu.ResultEnum;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理器
 *
 * @author dd-cat
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NotLoginException.class)
    public Result<String> handlerNotLoginException(NotLoginException nle) {

        // 打印堆栈，以供调试
        nle.printStackTrace();

        // 判断场景值，定制化异常信息
        var message = "";
        switch (nle.getType()) {
            case NotLoginException.NOT_TOKEN:
                message = "未提供token";
                break;
            case NotLoginException.INVALID_TOKEN:
                message = "token无效";
                break;
            case NotLoginException.TOKEN_TIMEOUT:
                message = "token已过期";
                break;
            case NotLoginException.BE_REPLACED:
                message = "token已被顶下线";
                break;
            case NotLoginException.KICK_OUT:
                message = "token已被踢下线";
                break;
            default:
                message = "当前会话未登录";
                break;
        }
        return Result.fail(Long.parseLong(nle.getType()), message);
    }

    /**
     * 业务异常
     */
    @ExceptionHandler(BusinessException.class)
    public Result<String> businessException(BusinessException e) {
        return Result.fail(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(RuntimeException.class)
    public Result<String> catchRuntimeException(RuntimeException e) {
        e.printStackTrace();
        return Result.fail(ResultEnum.FAIL.getCode(), ResultEnum.FAIL.getMessage());
    }

    /**
     * 校验错误拦截处理
     *
     * @param exception 错误信息集合
     * @return 错误信息
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result<String> handleException(MethodArgumentNotValidException exception) {
        var result = exception.getBindingResult();
        var message = "";
        if (result.hasErrors()) {
            var errors = result.getAllErrors();
            if (!errors.isEmpty()) {
                var fieldError = (FieldError) errors.get(0);
                message = fieldError.getDefaultMessage();
            }
        }
        return Result.fail(ResultEnum.PARAMETER_ERROR.getCode(), "".equals(message) ? "请填写正确信息" : (ResultEnum.PARAMETER_ERROR.getMessage() + message));
    }

    /**
     * 全局异常
     *
     * @param e 异常
     * @return Result
     */
    @ExceptionHandler(Exception.class)
    public Result<String> handleException(Exception e) {
        e.printStackTrace();
        return Result.fail(ResultEnum.FAIL.getCode(), ResultEnum.FAIL.getMessage());
    }
}
