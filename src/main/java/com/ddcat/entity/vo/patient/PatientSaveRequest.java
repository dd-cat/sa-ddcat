package com.ddcat.entity.vo.patient;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author dd-cat
 */
@Data
public class PatientSaveRequest {
    private Long id;
    /**
     * 手机号
     */
    @NotBlank(message = "手机号必填")
    private String mobile;
    /**
     * 姓名
     */
    @NotBlank(message = "姓名必填")
    private String name;
    /**
     * 心电设备SN号
     */
    private String snNo;
    /**
     * 组织机构id
     */
    private long[] deptIds;
}
