package com.ddcat.aspect;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONUtil;
import com.ddcat.constant.Constants;
import com.ddcat.entity.SysLog;
import com.ddcat.service.SysLogService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

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
        String className = point.getTarget().getClass().getName();
        String methodName = point.getSignature().getName();

        // 发送异步日志事件
        Long startTime = System.currentTimeMillis();
        Object obj;
        SysLog l = new SysLog();
        l.setMethod(className + "." + methodName + "()");
        l.setParams(JSONUtil.toJsonStr(point.getArgs()));
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
            l.setCreateUserId(StpUtil.getLoginId(Constants.USER_ID));
            logService.save(l);
        }
        return obj;
    }
}
