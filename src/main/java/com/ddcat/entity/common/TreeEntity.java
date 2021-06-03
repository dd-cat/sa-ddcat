package com.ddcat.entity.common;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * 树形数据
 *
 * @author dd-cat
 */
@AllArgsConstructor
@Data
public class TreeEntity {
    /**
     * ID
     */
    private long id;
    /**
     * 名称
     */
    private String name;
    /**
     * 子集
     */
    private List<TreeEntity> nodes;
}