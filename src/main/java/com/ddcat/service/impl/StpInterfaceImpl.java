package com.ddcat.service.impl;

import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.ddcat.entity.menu.SysMenu;
import com.ddcat.entity.role.SysRole;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
    public List<String> getPermissionList(Object loginId, String loginType) {
        if (StpUtil.getLoginType().equals(loginType)) {
            var permissions = new HashSet<String>();
            // 通过用户角色 ID 获取用户权限列表
            var roleIds = roleService.findRolesByUserId(Long.valueOf((String) loginId)).stream().map(SysRole::getId)
                    .collect(Collectors.toList());
            roleIds.forEach(roleId -> {
                var permissionList = menuService.findMenuByRoleId(roleId).stream()
                        .map(SysMenu::getPermission).filter(StrUtil::isNotEmpty)
                        .collect(Collectors.toList());
                permissions.addAll(permissionList);
            });
            return new ArrayList<>(permissions);
        }
        return new ArrayList<>();
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        if (StpUtil.getLoginType().equals(loginType)) {
            return roleService.findRolesByUserId(Long.valueOf((String) loginId)).stream().map(SysRole::getCode).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }
}
