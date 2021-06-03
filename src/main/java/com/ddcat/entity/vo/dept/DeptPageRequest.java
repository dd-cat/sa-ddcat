package com.ddcat.entity.vo.dept;

import com.ddcat.entity.common.PageQuery;
import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class DeptPageRequest extends PageQuery {

    /**
     * 父节点ID
     */
    private Long parentId;
    /**
     * 名称
     */
    private String name;
    /**
     * 类型
     */
    private Integer type;
    /**
     * 编码
     */
    private String code;
    /**
     * 排序字段 null:不排序 0:名称 1:类型 2:编码
     */
    private Byte sortField;
    /**
     * 是否升序
     */
    private Boolean isAsc;
}