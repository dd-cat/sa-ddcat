package com.ddcat.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.SysDict;
import com.ddcat.entity.SysDictItem;
import com.ddcat.entity.vo.dict.DictSaveRequest;
import com.ddcat.mapper.SysDictItemMapper;
import com.ddcat.mapper.SysDictMapper;
import com.ddcat.service.SysDictService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysDictServiceImpl extends BaseServiceImpl<SysDictMapper, SysDict> implements SysDictService {

    private final SysDictItemMapper dictItemMapper;
    
    @Override
    public void save(DictSaveRequest r) {
        SysDict entity = new SysDict();
        BeanUtils.copyProperties(r, entity);
        saveOrUpdate(entity);
        if (r.getId() != null && StrUtil.isNotBlank(r.getType())) {
            //修改子集type名称
            dictItemMapper.updateBatchById(r.getId(), r.getType());
        }
    }

    @Override
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    public void removeById(long id) {
        baseMapper.deleteById(id);
        dictItemMapper.delete(Wrappers.<SysDictItem>lambdaQuery().eq(SysDictItem::getDictId, id));
    }
}