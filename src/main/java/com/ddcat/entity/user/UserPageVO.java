package com.ddcat.entity.user;

import lombok.Data;

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
     * 性别 false男 true女
     */
    private Boolean sex;
}
