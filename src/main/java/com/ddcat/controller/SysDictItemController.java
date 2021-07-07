package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ddcat.annotation.Log;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.dict.DictItemDTO;
import com.ddcat.entity.dict.DictItemUpdateDTO;
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
    @Log("字典项根据ID查询单个")
    @GetMapping("{id}")
    @SaCheckLogin
    public SysDictItem getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 根据type获取字典项
     *
     * @param type -
     * @return -
     */
    @Log("根据type获取字典项")
    @GetMapping("type/{type}")
    @Cacheable(value = RedisKeyConstant.DICT, key = "#type")
    @SaCheckLogin
    public List<SysDictItem> select(@PathVariable String type) {
        return service.list(Wrappers.<SysDictItem>lambdaQuery().eq(SysDictItem::getType, type).orderByAsc(SysDictItem::getSort));
    }

    /**
     * 字典项保存or修改
     *
     * @param dto -
     */
    @Log("字典项保存or修改")
    @PostMapping
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    @SaCheckPermission({"sys:dict:add", "sys:dict:edit"})
    public void saveOrUpdate(@Valid @RequestBody DictItemDTO dto) {
        service.saveOrUpdate(dto);
    }

    /**
     * 批量更新字典项
     *
     * @param dto -
     */
    @Log("批量更新字典项")
    @PostMapping("updateItems")
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    @SaCheckPermission("sys:dict:edit")
    public void updateItems(@Valid @RequestBody DictItemUpdateDTO dto) {
        service.updateBatchById(dto.getDictItemList());
    }

    /**
     * 字典项删除
     *
     * @param id -
     */
    @Log("字典项删除")
    @DeleteMapping("/{id}")
    @CacheEvict(value = RedisKeyConstant.DICT, allEntries = true)
    @SaCheckPermission("sys:dict:del")
    public void deleteItem(@PathVariable long id) {
        service.removeById(id);
    }
}
