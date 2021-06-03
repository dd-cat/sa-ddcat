package com.ddcat.entity.vo.dict;

import com.ddcat.entity.common.Search;
import lombok.Data;

/**
 * @author dd-cat
 */
@Data
public class DictPageRequest extends Search {

    /**
     * 名称
     */
    private String name;
}