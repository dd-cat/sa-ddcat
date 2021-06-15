package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysRole;
import com.ddcat.entity.vo.role.RolePageRequest;
import com.ddcat.entity.vo.role.RoleSaveRequest;
import com.ddcat.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 角色
 *
 * @author dd-cat
 */
@RequestMapping("role")
@RestController
@RequiredArgsConstructor
public class SysRoleController {

    private final SysRoleService service;

    /**
     * 根据ID查询单个
     *
     * @param id -
     */
    @Log("角色根据ID查询单个")
    @GetMapping("{id}")
    @SaCheckLogin
    public SysRole getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 保存or修改
     *
     * @param r -
     */
    @Log("角色保存or修改")
    @PostMapping
    @SaCheckPermission({"sys:role:add", "sys:role:edit"})
    public void saveOrUpdate(@Valid @RequestBody RoleSaveRequest r) {
        service.saveOrUpdate(r);
    }

    /**
     * 分页查询
     *
     * @param r -
     */
    @Log("角色分页查询")
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysRole> page(@Valid @RequestBody RolePageRequest r) {
        return service.page(r);
    }

    /**
     * 删除
     *
     * @param id -
     */
    @Log("角色删除")
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:role:del")
    public void delete(@PathVariable long id) {
        SysRole entity = new SysRole();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }
}