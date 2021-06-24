package com.ddcat.entity.user;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class UserOnlineListVO {
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
