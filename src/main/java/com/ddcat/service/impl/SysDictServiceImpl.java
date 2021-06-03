package com.ddcat.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.SysDict;
import com.ddcat.entity.SysDictItem;
import com.ddcat.entity.vo.dict.DictSaveRequest;
import com.ddcat.mapper.SysDictItemMapper;
import com.ddcat.mapper.SysDictMapper;
import com.ddcat.service.SysDictService;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

/**
 * @author dd-cat
 */
@Service
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict>
        implements SysDictService {

    private final SysDictItemMapper dictItemMapper;

    public SysDictServiceImpl(SysDictItemMapper dictItemMapper) {
        this.dictItemMapper = dictItemMapper;
    }

    @Override
    public void save(DictSaveRequest r) {
        SysDict entity = new SysDict();
        BeanUtils.copyProperties(r, entity);
        saveOrUpdate(entity);
    }


    @Override
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    public void removeById(long id) {
        baseMapper.deleteById(id);
        dictItemMapper.delete(Wrappers.<SysDictItem>lambdaQuery().eq(SysDictItem::getDictId, id));
    }
}