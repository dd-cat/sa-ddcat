package com.ddcat.service.impl;

import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.ddcat.entity.SysMenu;
import com.ddcat.entity.SysRole;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author dd-cat
 */
@Component
@RequiredArgsConstructor
public class StpInterfaceImpl implements StpInterface {
    private final SysRoleService roleService;
    private final SysMenuService menuService;


    @Override
    public List<String> getPermissionList(Object loginId, String loginKey) {
        if (StpUtil.KEY.equals(loginKey)) {
            Set<String> permissions = new HashSet<>();
            // 通过用户角色 ID 获取用户权限列表
            List<Long> roleIds = roleService.findRolesByUserId(Long.valueOf((String) loginId)).stream().map(SysRole::getId)
                    .collect(Collectors.toList());
            roleIds.forEach(roleId -> {
                List<String> permissionList = menuService.findPermissionByRoleId(roleId).stream()
                        .map(SysMenu::getPermission).filter(StrUtil::isNotEmpty)
                        .collect(Collectors.toList());
                permissions.addAll(permissionList);
            });
            return new ArrayList<>(permissions);
        }
        return null;
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginKey) {
        if (StpUtil.KEY.equals(loginKey)) {
            return roleService.findRolesByUserId(Long.valueOf((String) loginId)).stream().map(SysRole::getCode).collect(Collectors.toList());
        }
        return null;
    }
}
