package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.entity.dict.DictDTO;
import com.ddcat.entity.dict.DictPageDTO;
import com.ddcat.entity.dict.SysDict;
import com.ddcat.service.SysDictService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

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
     * 列表
     *
     * @return -
     */
    @GetMapping("list")
    @SaCheckLogin
    public List<SysDict> list() {
        return service.list(Wrappers.<SysDict>lambdaQuery().select(SysDict::getName, SysDict::getType));
    }

    /**
     * 根据ID查询单个
     *
     * @param id -
     */
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
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysDict> page(@Valid @RequestBody DictPageDTO dto) {
        return service.page(new Page<>(dto.getCurrent(), dto.getSize()), Wrappers.<SysDict>lambdaQuery()
                .select(SysDict::getId, SysDict::getType, SysDict::getName)
                .like(StrUtil.isNotBlank(dto.getName()), SysDict::getName, dto.getName())
                .like(StrUtil.isNotBlank(dto.getType()), SysDict::getType, dto.getType())
        );
    }

    /**
     * 字典保存or修改
     *
     * @param dto -
     */
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
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:dict:del")
    public void delete(@PathVariable long id) {
        service.removeById(id);
    }

}
