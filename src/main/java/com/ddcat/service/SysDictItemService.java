package com.ddcat.service;

import com.ddcat.base.BaseService;
import com.ddcat.entity.dict.DictItemSaveDTO;
import com.ddcat.entity.dict.SysDictItem;

/**
 * @author dd-cat
 */
public interface SysDictItemService extends BaseService<SysDictItem> {

    /**
     * 字典项保存or修改
     *
     * @param dto -
     */
    void saveItem(DictItemSaveDTO dto);
}
