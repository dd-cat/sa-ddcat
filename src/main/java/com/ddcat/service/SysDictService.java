package com.ddcat.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ddcat.entity.SysDict;
import com.ddcat.entity.vo.dict.DictSaveRequest;

/**
 * @author dd-cat
 */
public interface SysDictService extends IService<SysDict> {

    /**
     * 保存
     *
     * @param r -
     */
    void save(DictSaveRequest r);

    /**
     * 删除字典and字典项
     *
     * @param id -
     */
    void removeById(long id);

}