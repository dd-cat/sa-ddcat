package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.text.CharSequenceUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.annotation.Log;
import com.ddcat.entity.dict.DictDTO;
import com.ddcat.entity.dict.DictPageDTO;
import com.ddcat.entity.dict.SysDict;
import com.ddcat.service.SysDictService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 字典
 *
 * @author dd-cat
 */
@RequestMapping("dict")
@RestController
@RequiredArgsConstructor
public class SysDictController {

    private final SysDictService service;

    /**
     * 根据ID查询单个
     *
     * @param id -
     */
    @Log("字典根据ID查询单个")
    @GetMapping("{id}")
    @SaCheckLogin
    public SysDict getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 分页查询
     *
     * @param dto -
     * @return -
     */
    @Log("字典分页查询")
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysDict> page(@Valid @RequestBody DictPageDTO dto) {
        return service.page(new Page<>(dto.getCurrent(), dto.getSize()), Wrappers.<SysDict>lambdaQuery()
                .like(CharSequenceUtil.isNotBlank(dto.getName()), SysDict::getName, dto.getName()));
    }

    /**
     * 字典保存or修改
     *
     * @param dto -
     */
    @Log("字典保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:dict:add", "sys:dict:edit"})
    public void saveOrUpdate(@Valid @RequestBody DictDTO dto) {
        service.saveOrUpdate(dto);
    }

    /**
     * 字典删除
     *
     * @param id -
     */
    @Log("字典删除")
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:dict:del")
    public void delete(@PathVariable long id) {
        var entity = new SysDict();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }
}
