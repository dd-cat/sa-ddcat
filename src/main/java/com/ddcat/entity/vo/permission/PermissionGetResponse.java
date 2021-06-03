package com.ddcat.entity.vo.permission;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class PermissionGetResponse {
    /**
     * 名称
     */
    private String name;
    /**
     * 类型 0:菜单 1:权限
     */
    private Byte type;
    /**
     * 菜单 type为0时使用
     */
    private String url;
    /**
     * 图标 type为0时使用
     */
    private String icon;
    /**
     * 权限编码 type为1时使用
     */
    private String code;
}