package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
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
        //先修改子集
        if (dto.getId() != null && !dto.getType().isBlank()) {
            var dict = baseMapper.selectById(dto.getId());
            if (!dict.getType().equals(dto.getType())) {
                var updateWrapper = Wrappers.<SysDictItem>lambdaUpdate()
                        .set(SysDictItem::getType, dto.getType())
                        .eq(SysDictItem::getType, dict.getType());
                dictItemMapper.update(null, updateWrapper);
            }
        }
        super.saveOrUpdate(entity);
    }

    @Override
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    public void removeById(long id) {
        baseMapper.deleteById(id);
        dictItemMapper.delete(Wrappers.<SysDictItem>lambdaQuery().eq(SysDictItem::getDictId, id));
    }
}
