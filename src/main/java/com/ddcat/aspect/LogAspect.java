package com.ddcat.aspect;

import cn.dev33.satoken.stp.StpUtil;
import com.ddcat.entity.SysLog;
import com.ddcat.service.SysLogService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Arrays;

/**
 * @author dd-cat
 */
@Aspect
@Slf4j
@Component
public class LogAspect {
    private final SysLogService logService;

    public LogAspect(SysLogService logService) {
        this.logService = logService;
    }

    @SneakyThrows
    @Around("@annotation(sysLog)")
    public Object around(ProceedingJoinPoint point, com.ddcat.annotation.Log sysLog) {
        var className = point.getTarget().getClass().getName();
        var methodName = point.getSignature().getName();

        // 发送异步日志事件
        var startTime = System.currentTimeMillis();
        Object obj;
        var l = new SysLog();
        l.setMethod(className + "." + methodName + "()");
        l.setParams(Arrays.toString(point.getArgs()));
        l.setTitle(sysLog.value());
        try {
            obj = point.proceed();
        } catch (Exception e) {
            l.setException(e.getMessage());
            throw e;
        } finally {
            Long endTime = System.currentTimeMillis();
            l.setTime(endTime - startTime);
            l.setCreateTime(LocalDateTime.now());
            l.setCreateUserId(StpUtil.getLoginIdAsLong());
            logService.save(l);
        }
        return obj;
    }
}
