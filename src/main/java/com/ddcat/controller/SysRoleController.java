package com.ddcat.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.entity.role.RoleDTO;
import com.ddcat.entity.role.RolePageDTO;
import com.ddcat.entity.role.SysRole;
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
    @GetMapping("{id}")
    @SaCheckLogin
    public SysRole getById(@PathVariable long id) {
        return service.getById(id);
    }

    /**
     * 保存or修改
     *
     * @param dto -
     */
    @PostMapping
    @SaCheckPermission({"sys:role:add", "sys:role:edit"})
    public void saveOrUpdate(@Valid @RequestBody RoleDTO dto) {
        service.saveOrUpdate(dto);
    }

    /**
     * 分页查询
     *
     * @param dto -
     */
    @PostMapping("page")
    @SaCheckLogin
    public IPage<SysRole> page(@Valid @RequestBody RolePageDTO dto) {
        return service.page(dto);
    }

    /**
     * 删除
     *
     * @param id -
     */
    @DeleteMapping("{id}")
    @SaCheckPermission("sys:role:del")
    public void delete(@PathVariable long id) {
        service.removeById(id);
    }
}
