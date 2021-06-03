package com.ddcat.entity.vo.patient;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class PatientPageResponse {
    private long id;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 姓名
     */
    private String name;
    /**
     * 心电设备SN号
     */
    private String snNo;
    /**
     * 所属机构
     */
    private String deptName;
}
