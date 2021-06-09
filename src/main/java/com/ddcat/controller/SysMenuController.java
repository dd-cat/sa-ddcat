package com.ddcat.controller;

import cn.hutool.core.lang.tree.Tree;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysMenu;
import com.ddcat.entity.vo.menu.MenuSaveRequest;
import com.ddcat.service.SysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
    public List<Tree<Long>> tree() {
        Set<SysMenu> all = new HashSet<>(service.list());
        return service.tree(all);
    }

    /**
     * 保存
     *
     * @return -
     */
    @Log("菜单保存")
    @PostMapping
    public void save(@Valid @RequestBody MenuSaveRequest r) {
        SysMenu entity = new SysMenu();
        BeanUtils.copyProperties(r, entity);
        service.saveOrUpdate(entity);
    }

    /**
     * 删除
     *
     * @return -
     */
    @Log("菜单删除")
    @DeleteMapping("{id}")
    public void delete(@PathVariable long id) {
        service.removeById(id);
    }

    /**
     * 通过角色ID获取菜单ID
     *
     * @param id -
     * @return -
     */
    @Log("通过角色ID获取菜单ID")
    @GetMapping("getByRoleId/{id}")
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
    public List<Tree<Long>> getUserMenus() {
        return service.getUserMenus();
    }
}