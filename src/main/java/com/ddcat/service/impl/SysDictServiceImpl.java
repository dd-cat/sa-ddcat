package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.dict.DictDTO;
import com.ddcat.entity.dict.SysDict;
import com.ddcat.entity.dict.SysDictItem;
import com.ddcat.enums.ResultEnum;
import com.ddcat.exception.BusinessException;
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
    public void saveOrUpdate(DictDTO dto) {
        LambdaQueryWrapper<SysDict> queryWrapper = Wrappers.<SysDict>lambdaQuery()
                .eq(SysDict::getType, dto.getType());
        if (dto.getId() != null) {
            queryWrapper.ne(SysDict::getId, dto.getId());
        }
        Integer count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000007);
        }

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
