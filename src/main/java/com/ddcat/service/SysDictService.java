package com.ddcat.service;

import com.ddcat.base.BaseService;
import com.ddcat.entity.dict.DictSaveDTO;
import com.ddcat.entity.dict.SysDict;

/**
 * @author dd-cat
 */
public interface SysDictService extends BaseService<SysDict> {

    /**
     * 保存
     *
     * @param dto -
     */
    void save(DictSaveDTO dto);

    /**
     * 删除字典and字典项
     *
     * @param id -
     */
    void removeById(long id);

}
