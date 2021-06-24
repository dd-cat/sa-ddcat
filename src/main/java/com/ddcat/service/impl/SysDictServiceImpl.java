package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.dict.DictSaveDTO;
import com.ddcat.entity.dict.SysDict;
import com.ddcat.entity.dict.SysDictItem;
import com.ddcat.mapper.SysDictItemMapper;
import com.ddcat.mapper.SysDictMapper;
import com.ddcat.service.SysDictService;
import lombok.RequiredArgsConstructor;
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
    public void save(DictSaveDTO dto) {
        var entity = new SysDict();
        BeanUtil.copyProperties(dto, entity);
        saveOrUpdate(entity);
        if (dto.getId() != null && StrUtil.isNotBlank(dto.getType())) {
            //修改子集type名称
            dictItemMapper.updateBatchById(dto.getId(), dto.getType());
        }
    }

    @Override
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    public void removeById(long id) {
        baseMapper.deleteById(id);
        dictItemMapper.delete(Wrappers.<SysDictItem>lambdaQuery().eq(SysDictItem::getDictId, id));
    }
}
