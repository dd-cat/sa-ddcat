package com.ddcat.entity.dict;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @author dd-cat
 */
@Data
public class DictItemDTO {

    private Long id;
    /**
     * 类型
     */
    @Length(max = 20, message = "类型长度为[1-20]")
    @NotBlank(message = "类型必填")
    private String type;
    /**
     * 名称
     */
    @Length(max = 20, message = "名称长度为[1-20]")
    @NotBlank(message = "名称必填")
    private String name;
    /**
     * 值
     */
    @Length(max = 10, message = "值长度为[1-10]")
    @NotBlank(message = "值必填")
    private String value;

    /**
     * 状态
     */
    @NotNull(message = "状态必填")
    private Boolean status;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 备注
     */
    @Length(max = 255, message = "备注长度为[0-10]")
    private String remark;
}
