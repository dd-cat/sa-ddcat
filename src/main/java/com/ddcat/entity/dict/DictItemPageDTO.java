package com.ddcat.entity.dict;

import com.ddcat.entity.common.Search;
import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class DictItemPageDTO extends Search {
    /**
     * 类型
     */
    private String type;
    /**
     * 名称
     */
    private String name;
    /**
     * 状态 （字典sys_normal_disable）
     */
    private Boolean status;
}
