package com.ddcat.service;

import com.ddcat.base.BaseService;
import com.ddcat.entity.SysDictItem;
import com.ddcat.entity.vo.dict.DictItemSaveRequest;

/**
 * @author dd-cat
 */
public interface SysDictItemService extends BaseService<SysDictItem> {

    /**
     * 字典项保存or修改
     *
     * @param r -
     */
    void saveItem(DictItemSaveRequest r);
}