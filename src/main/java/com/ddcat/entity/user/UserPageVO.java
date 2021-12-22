package com.ddcat.entity.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author dd-cat
 */
@Data
public class UserPageVO {
    /**
     * 序号
     */
    private Long id;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 账户
     */
    private String account;
    /**
     * 姓名
     */
    private String name;
    /**
     * 所属机构
     */
    private String deptName;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime createTime;
}
