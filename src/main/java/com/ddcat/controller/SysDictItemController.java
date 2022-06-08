package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.dict.DictItemDTO;
import com.ddcat.entity.dict.DictItemPageDTO;
import com.ddcat.entity.dict.SysDictItem;
import com.ddcat.service.SysDictItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 字典
 *
 * @author dd-cat
 */
@RequestMapping("dict/item")
@RestController
@RequiredArgsConstructor
public class SysDictItemController {

    private final SysDictItemService service;

    /**
     * 查询单个
     *
     * @param id -
     */
    @GetMapping("{id}")
    @SaCheckLogin
    public SysDictItem getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 分页查询
     *
     * @param dto -
     * @return -
     */
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysDictItem> page(@Valid @RequestBody DictItemPageDTO dto) {
        return service.page(new Page<>(dto.getCurrent(), dto.getSize()), Wrappers.<SysDictItem>lambdaQuery()
                .select(SysDictItem::getId, SysDictItem::getName, SysDictItem::getValue, SysDictItem::getType, SysDictItem::getRemark, SysDictItem::getSort, SysDictItem::getStatus)
                .like(StrUtil.isNotBlank(dto.getType()), SysDictItem::getType, dto.getType())
                .like(StrUtil.isNotBlank(dto.getName()), SysDictItem::getName, dto.getName())
                .eq(dto.getStatus() != null, SysDictItem::getStatus, dto.getStatus())
        );
    }

    /**
     * 根据type获取字典项
     *
     * @param type -
     * @return -
     */
    @GetMapping("type/{type}")
    @Cacheable(value = RedisKeyConstant.DICT, key = "#type")
    @SaCheckLogin
    public List<SysDictItem> select(@PathVariable String type) {
        return service.list(Wrappers.<SysDictItem>lambdaQuery()
                .select(SysDictItem::getName, SysDictItem::getValue)
                .eq(SysDictItem::getType, type).orderByAsc(SysDictItem::getSort));
    }

    /**
     * 字典项保存or修改
     *
     * @param dto -
     */
    @PostMapping
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    @SaCheckPermission({"sys:dict:add", "sys:dict:edit"})
    public void saveOrUpdate(@Valid @RequestBody DictItemDTO dto) {
        service.saveOrUpdate(dto);
    }

    /**
     * 字典项删除
     *
     * @param id -
     */
    @DeleteMapping("/{id}")
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    @SaCheckPermission("sys:dict:del")
    public void deleteItem(@PathVariable long id) {
        service.removeById(id);
    }
}
