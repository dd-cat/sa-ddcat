package com.ddcat.entity.common;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 搜索封装类
 *
 * @author dd-cat
 */
@Data
public class Search implements Serializable {
    /**
     * 关键词
     */
    private String keyword;
    /**
     * 搜索字段
     */
    private String searchField;
    /**
     * 搜索值
     */
    private String searchValue;
    /**
     * 开始日期
     */
    private String beginTime;
    /**
     * 结束日期
     */
    private String endTime;
    /**
     * 当前页 默认1
     */
    @Min(value = 1, message = "开始页数必须大于0")
    @NotNull(message = "开始页数必填")
    private int current = 1;
    /**
     * 页大小 默认10
     */
    @Min(value = 1, message = "每页数据数量最小为1")
    @Max(value = 1000, message = "每页数据数量最大为1000")
    @NotNull(message = "每页数据数量必填")
    private int size = 10;
    /**
     * 排序属性
     */
    private String prop;
    /**
     * 排序方式：asc,desc
     */
    private String order;
}
