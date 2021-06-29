package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.lang.tree.Tree;
import com.ddcat.annotation.Log;
import com.ddcat.entity.menu.MenuSaveDTO;
import com.ddcat.entity.menu.SysMenu;
import com.ddcat.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;

/**
 * 菜单
 *
 * @author dd-cat
 */
@RequestMapping("menu")
@RestController
@RequiredArgsConstructor
public class SysMenuController {

    private final SysMenuService service;

    /**
     * 根据ID查询单个
     *
     * @param id -
     */
    @Log("菜单根据ID查询单个")
    @GetMapping("{id}")
    @SaCheckLogin
    public SysMenu getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 获取树形数据
     *
     * @return -
     */
    @Log("菜单获取树形数据")
    @GetMapping("tree")
    @SaCheckLogin
    public List<Tree<Long>> tree() {
        var all = new HashSet<>(service.list());
        return service.tree(all);
    }

    /**
     * 保存or修改
     *
     * @return -
     */
    @Log("菜单保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:menu:add", "sys:menu:edit"})
    public void saveOrUpdate(@Valid @RequestBody MenuSaveDTO dto) {
        var entity = new SysMenu();
        BeanUtils.copyProperties(dto, entity);
        service.saveOrUpdate(entity);
    }

    /**
     * 删除
     *
     * @return -
     */
    @Log("菜单删除")
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:menu:del")
    public void delete(@PathVariable long id) {
        var entity = new SysMenu();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }

    /**
     * 通过角色ID获取菜单ID
     *
     * @param id -
     * @return -
     */
    @Log("通过角色ID获取菜单ID")
    @GetMapping("getByRoleId/{id}")
    @SaCheckLogin
    public List<Long> getByRoleId(@PathVariable long id) {
        return service.getByRoleId(id);
    }

    /**
     * 当前登录人菜单信息
     *
     * @return -
     */
    @GetMapping
    @Log("当前登录人菜单信息")
    @SaCheckLogin
    public List<Tree<Long>> getUserMenus() {
        return service.getUserMenus();
    }
}
