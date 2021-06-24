package com.ddcat.entity.user;

import com.ddcat.entity.common.Search;
import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class UserOnlineListDTO extends Search {
    private Long[] ids;
    /**
     * 1：在綫 2：全部
     */
    private int flag;
}
