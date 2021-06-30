package com.ddcat.service;

import com.ddcat.base.BaseService;
import com.ddcat.entity.dict.DictDTO;
import com.ddcat.entity.dict.SysDict;

/**
 * @author dd-cat
 */
public interface SysDictService extends BaseService<SysDict> {

    /**
     * 字典保存or修改
     *
     * @param dto -
     */
    void saveOrUpdate(DictDTO dto);

    /**
     * 删除字典and字典项
     *
     * @param id -
     */
    void removeById(long id);

}
