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
     * 账户
     */
    private String account;
    /**
     * 姓名
     */
    private String name;
    /**
     * 角色
     */
    private String roleName;
    /**
     * 所属机构
     */
    private String deptName;
}
