package com.ddcat.service;

import com.ddcat.base.BaseService;
import com.ddcat.entity.dict.DictItemDTO;
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
    void saveOrUpdate(DictItemDTO dto);
}
