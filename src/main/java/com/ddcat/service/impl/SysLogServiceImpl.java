package com.ddcat.service.impl;

import com.ddcat.entity.SysLog;
import com.ddcat.mapper.SysLogMapper;
import com.ddcat.service.SysLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysLogServiceImpl implements SysLogService {
    private final SysLogMapper mapper;

    @Override
    @Async
    public void save(SysLog log) {
        mapper.insert(log);
    }
}