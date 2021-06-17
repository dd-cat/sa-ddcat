package com.ddcat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.SysMenu;
import com.ddcat.entity.SysRole;
import com.ddcat.entity.common.BaseEntity;
import com.ddcat.mapper.SysMenuMapper;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
    private final SysRoleService roleService;

    @Override
    public List<Tree<Long>> tree(Set<SysMenu> all) {
        List<TreeNode<Long>> nodeList = CollUtil.newArrayList();
        for (SysMenu menu : all) {
            TreeNode<Long> treeNode = new TreeNode<>(menu.getId(), menu.getParentId(), menu.getName(), menu.getSort());
            Map<String, Object> extra = new HashMap<>();
            extra.put("path", menu.getPath());
            extra.put("icon", menu.getIcon());
            extra.put("permission", menu.getPermission());
            treeNode.setExtra(extra);
            nodeList.add(treeNode);
        }
        return TreeUtil.build(nodeList, -1L);
    }

    @Override
    public List<Long> getByRoleId(long id) {
        return baseMapper.getByRoleId(id);
    }

    @Override
    public List<SysMenu> findPermissionByRoleId(Long roleId) {
        return baseMapper.listPermissionByRoleId(roleId);
    }

    @Override
    public List<Tree<Long>> getUserMenus() {
        List<SysMenu> all = new ArrayList<>();
        List<Long> roleIds = roleService.findRolesByUserId(StpUtil.getLoginIdAsLong()).stream().map(SysRole::getId)
                .collect(Collectors.toList());
        roleIds.forEach(roleId -> {
            List<SysMenu> collect = baseMapper.listPermissionByRoleId(roleId).stream()
                    .filter(permission -> 2 != permission.getType())
                    .collect(Collectors.toList());
            all.addAll(collect);

        });
        Set<SysMenu> personSet = new TreeSet<>(Comparator.comparing(BaseEntity::getId));
        personSet.addAll(all);
        return tree(personSet);
    }
}
