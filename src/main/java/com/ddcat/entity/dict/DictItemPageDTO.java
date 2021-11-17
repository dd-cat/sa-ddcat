package com.ddcat.entity.dict;

import com.ddcat.entity.common.Search;
import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class DictItemPageDTO extends Search {

    /**
     * 名称
     */
    private String name;
}
