package com.ddcat.entity.dict;

import com.ddcat.entity.common.BaseEntity;
import lombok.Data;

/**
 * 字典项
 *
 * @author dd-cat
 */
@Data
public class SysDictItem extends BaseEntity {
    /**
     * 类型
     */
    private String type;
    /**
     * 名称
     */
    private String name;
    /**
     * 值
     */
    private String value;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 状态 （字典sys_normal_disable）
     */
    private Boolean status;
    /**
     * 备注
     */
    private String remark;
}
