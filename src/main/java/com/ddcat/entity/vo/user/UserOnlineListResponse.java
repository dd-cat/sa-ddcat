package com.ddcat.entity.vo.user;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class UserOnlineListResponse {
    private Long id;
    /**
     * 姓名
     */
    private String name;
    /**
     * 在线 离线状态
     */
    private String status;
}
