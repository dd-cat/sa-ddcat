package com.ddcat.entity.vo.dict;

import com.ddcat.entity.SysDictItem;
import lombok.Data;

import java.util.List;

/**
 * @author dd-cat
 */
@Data
public class DictItemUpdateRequest {

    List<SysDictItem> dictItemList;
}