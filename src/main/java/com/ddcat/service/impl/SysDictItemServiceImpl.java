package com.ddcat.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.entity.SysDictItem;
import com.ddcat.entity.vo.dict.DictItemSaveRequest;
import com.ddcat.mapper.SysDictItemMapper;
import com.ddcat.service.SysDictItemService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * @author dd-cat
 */
@Service
public class SysDictItemServiceImpl extends ServiceImpl<SysDictItemMapper, SysDictItem> implements SysDictItemService {
    @Override
    public void saveItem(DictItemSaveRequest r) {
        SysDictItem entity = new SysDictItem();
        BeanUtils.copyProperties(r, entity);
        saveOrUpdate(entity);
    }
}