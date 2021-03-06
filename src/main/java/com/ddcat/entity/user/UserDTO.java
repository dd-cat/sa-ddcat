package com.ddcat.entity.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 用户保存
 *
 * @author dd-cat
 */
@Data
public class UserDTO {
    private Long id;
    /**
     * 账户
     */
    @NotBlank(message = "账号必填")
    private String account;
    /**
     * 姓名
     */
    @NotBlank(message = "姓名必填")
    private String name;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 性别 false:男 true:女
     */
    private Boolean sex;
    /**
     * 身份证
     */
    private String idCard;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 所属机构
     */
    @NotNull(message = "所属机构必填")
    private Long deptId;
    /**
     * 个人简介
     */
    @NotNull(message = "个人简介必填")
    private String remark;
    /**
     * 角色
     */
    private long[] roleIds;
}
