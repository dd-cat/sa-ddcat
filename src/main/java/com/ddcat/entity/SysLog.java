package com.ddcat.entity;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author dd-cat
 */
@Data
public class SysLog implements Serializable {
    private Long id;

    /**
     * 创建者
     */
    private Long createBy;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 路径
     */
    private String path;
    /**
     * ip
     */
    private String localhost;
    /**
     * 提交的数据
     */
    private String params;
    /**
     * 方法名称
     */
    private String method;
    /**
     * 执行时间
     */
    private Long time;
    /**
     * 异常信息
     */
    private String exception;

}

