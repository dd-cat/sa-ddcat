package com.ddcat.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysDict;
import com.ddcat.entity.vo.dict.DictPageRequest;
import com.ddcat.entity.vo.dict.DictSaveRequest;
import com.ddcat.service.SysDictService;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 字典
 *
 * @author dd-cat
 */
@RequestMapping("dict")
@RestController
public class SysDictController {

    private final SysDictService service;

    public SysDictController(SysDictService service) {
        this.service = service;
    }

    /**
     * 分页查询
     *
     * @param r -
     * @return -
     */
    @Log("字典分页查询")
    @PostMapping("page")
    IPage<SysDict> page(@Valid @RequestBody DictPageRequest r) {
        return service.page(new Page<>(r.getCurrent(), r.getSize()), Wrappers.<SysDict>lambdaQuery().like(StrUtil.isNotBlank(r.getName()), SysDict::getName, r.getName()));
    }

    /**
     * 字典保存or修改
     *
     * @param r -
     */
    @Log("字典保存or修改")
    @PostMapping
    void save(@Valid @RequestBody DictSaveRequest r) {
        service.save(r);
    }

    /**
     * 字典删除
     *
     * @param id -
     */
    @Log("字典删除")
    @DeleteMapping("{id}")
    void delete(@PathVariable long id) {
        service.removeById(id);
    }
}