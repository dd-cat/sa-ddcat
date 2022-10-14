package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.metadata.IPage;
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
import java.util.Set;

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
    @GetMapping("tree")
    @SaCheckLogin
    public List<Tree<Long>> tree() {
        Set<SysDept> all = new HashSet<>(service.list());
        return service.tree(all);
    }

    /**
     * 保存or修改
     *
     * @param dto -
     * @throws IOException -
     */
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
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:dept:del")
    public void delete(@PathVariable long id) {
        service.removeById(id);
    }
}
