package com.ddcat.entity.vo.dept;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @author dd-cat
 */
@Data
public class DeptSaveRequest {

    private Long id;
    /**
     * 机构名称
     */
    @NotBlank(message = "机构名称必填")
    private String name;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 父节点ID
     */
    @NotNull(message = "上级机构必填")
    private Long parentId;
    /**
     * 机构编码
     */
    @NotNull(message = "机构编码必填")
    private String code;
}