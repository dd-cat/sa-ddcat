package com.ddcat.entity.common;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * 分页查询对象
 *
 * @author dd-cat
 */
@Data
@AllArgsConstructor
public class PageEntity<T> {
    /**
     * 数据
     */
    private List<T> data;
    /**
     * 数据量
     */
    private long count;
}