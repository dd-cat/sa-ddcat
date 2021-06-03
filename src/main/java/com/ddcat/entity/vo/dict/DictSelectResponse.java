package com.ddcat.entity.vo.dict;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author dd-cat
 */
@AllArgsConstructor
@Data
public class DictSelectResponse {
    private String id;
    private String name;
    private String value;
}