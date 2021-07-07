package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.annotation.Log;
import com.ddcat.entity.dept.DeptDTO;
import com.ddcat.entity.dept.DeptPageDTO;
import com.ddcat.entity.dept.SysDept;
import com.ddcat.service.SysDeptService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;

/**
 * 部门
 *
 * @author dd-cat
 */
@RequestMapping("dept")
@RestController
@RequiredArgsConstructor
public class SysDeptController {

    private final SysDeptService service;

    /**
     * 根据ID查询单个
     *
     * @param id -
     */
    @Log("部门根据ID查询单个")
    @GetMapping("{id}")
    @SaCheckLogin
    public SysDept getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 获取树形数据
     *
     * @return -
     */
    @Log("组织获取树形数据")
    @GetMapping("tree")
    @SaCheckLogin
    public List<Tree<Long>> tree() {
        var all = new HashSet<>(service.list());
        return service.tree(all);
    }

    /**
     * 保存or修改
     *
     * @param dto -
     * @throws IOException -
     */
    @Log("组织保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:dept:add", "sys:dept:edit"})
    public void saveOrUpdate(@Valid @RequestBody DeptDTO dto) throws IOException {
        service.saveOrUpdate(dto);
    }

    /**
     * 分页查询
     *
     * @param dto -
     */
    @Log("组织分页查询")
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysDept> page(@RequestBody DeptPageDTO dto) {
        return service.page(dto);
    }

    /**
     * 删除
     *
     * @param id -
     */
    @Log("组织删除")
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:dept:del")
    public void delete(@PathVariable long id) {
        service.removeById(id);
    }
}
