package com.ddcat.entity.dept;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class DeptPageVO {

    private long id;
    /**
     * 父节点ID
     */
    private Long parentId;
    /**
     * 名称
     */
    private String name;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 类型
     */
    private String typeText;
    /**
     * 编码
     */
    private String code;
}
