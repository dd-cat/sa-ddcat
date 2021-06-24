package com.ddcat.entity.role;

import com.ddcat.entity.common.BaseEntity;
import lombok.Data;

/**
 * 角色
 *
 * @author dd-cat
 */
@Data
public class SysRole extends BaseEntity {
    /**
     * 角色名称
     */
    private String name;
    /**
     * 角色编码
     */
    private String code;
    /**
     * 角色描述
     */
    private String remark;
}
