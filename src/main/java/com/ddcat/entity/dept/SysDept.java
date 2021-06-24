package com.ddcat.entity.dept;

import com.ddcat.entity.common.BaseEntity;
import lombok.Data;

/**
 * 组织机构
 *
 * @author dd-cat
 */
@Data
public class SysDept extends BaseEntity {
    /**
     * 父节点ID
     */
    private Long parentId;
    /**
     * 名称
     */
    private String name;
    /**
     * 机构编码
     */
    private String code;
    /**
     * 机构LOGO
     */
    private String avatar;
    /**
     * 排序
     */
    private Integer sort;

}
