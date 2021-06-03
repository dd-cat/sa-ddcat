package com.ddcat.entity.vo.role;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class RolePageResponse {

    private long id;
    /**
     * 名称
     */
    private String name;
    /**
     * 编码
     */
    private String code;
    /**
     * 备注
     */
    private String remark;
}