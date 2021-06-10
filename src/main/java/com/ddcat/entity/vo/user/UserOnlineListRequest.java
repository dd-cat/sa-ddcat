package com.ddcat.entity.vo.user;

import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class UserOnlineListRequest {
    private Long[] ids;
    /**
     * 1：在綫 2：全部
     */
    private int flag;
}
