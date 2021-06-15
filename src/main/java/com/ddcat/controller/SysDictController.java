package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysDict;
import com.ddcat.entity.vo.dict.DictPageRequest;
import com.ddcat.entity.vo.dict.DictSaveRequest;
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
     * @param r -
     * @return -
     */
    @Log("字典分页查询")
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysDict> page(@Valid @RequestBody DictPageRequest r) {
        return service.page(new Page<>(r.getCurrent(), r.getSize()), Wrappers.<SysDict>lambdaQuery().like(StrUtil.isNotBlank(r.getName()), SysDict::getName, r.getName()));
    }

    /**
     * 字典保存or修改
     *
     * @param r -
     */
    @Log("字典保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:dict:add", "sys:dict:edit"})
    public void saveOrUpdate(@Valid @RequestBody DictSaveRequest r) {
        service.save(r);
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
        SysDict entity = new SysDict();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }
}