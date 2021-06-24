package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.dict.DictItemSaveDTO;
import com.ddcat.entity.dict.SysDictItem;
import com.ddcat.mapper.SysDictItemMapper;
import com.ddcat.service.SysDictItemService;
import org.springframework.stereotype.Service;

/**
 * @author dd-cat
 */
@Service
public class SysDictItemServiceImpl extends BaseServiceImpl<SysDictItemMapper, SysDictItem> implements SysDictItemService {
    @Override
    public void saveItem(DictItemSaveDTO dto) {
        var entity = new SysDictItem();
        BeanUtil.copyProperties(dto, entity);
        saveOrUpdate(entity);
    }
}
