package com.ddcat.entity.common;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 基础实体
 *
 * @author dd-cat
 */
@Data
public class BaseEntity implements Serializable {
    /**
     * 主键id
     */
    private Long id;
    /**
     * 创建者
     */
    @TableField(fill = FieldFill.INSERT, updateStrategy = FieldStrategy.NEVER)
    private Long createBy;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT, updateStrategy = FieldStrategy.NEVER)
    private LocalDateTime createTime;
    /**
     * 更新者
     */
    @TableField(fill = FieldFill.UPDATE, insertStrategy = FieldStrategy.NEVER)
    private Long updateBy;
    /**
     * 更新者
     */
    @TableField(fill = FieldFill.UPDATE, insertStrategy = FieldStrategy.NEVER)
    private LocalDateTime updateTime;
    /**
     * 逻辑已删除值(默认为 1) 逻辑未删除值(默认为 0)
     */
    @TableField(select = false)
    private Boolean flag;
}
