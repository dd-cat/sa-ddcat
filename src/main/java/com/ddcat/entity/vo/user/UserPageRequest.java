package com.ddcat.entity.vo.user;

import com.ddcat.entity.common.Search;
import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class UserPageRequest extends Search {
    /**
     * 账户
     */
    private String account;
    /**
     * 姓名
     */
    private String name;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 所属机构
     */
    private Long deptId;
}
