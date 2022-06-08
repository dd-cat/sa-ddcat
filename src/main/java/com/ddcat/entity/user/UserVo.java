package com.ddcat.entity.user;

import lombok.Data;

/**
 * 用户信息
 *
 * @author dd-cat
 */
@Data
public class UserVo {
    private Long id;
    /**
     * 账户
     */
    private String account;
    /**
     * 用户名
     */
    private String name;
    /**
     * 性别 0:男 1:女
     */
    private Boolean sex;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 所属机构
     */
    private Long deptId;
    /**
     * 个人简介
     */
    private String remark;
    /**
     * 角色
     */
    private Long[] roleIds;
}
