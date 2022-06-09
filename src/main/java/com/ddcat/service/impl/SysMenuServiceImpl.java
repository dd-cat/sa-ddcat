package com.ddcat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.common.BaseEntity;
import com.ddcat.entity.menu.MenuMetaVo;
import com.ddcat.entity.menu.SysMenu;
import com.ddcat.entity.role.SysRole;
import com.ddcat.mapper.SysMenuMapper;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
    private final SysRoleService roleService;

    @Override
    public List<Tree<Long>> tree(Set<SysMenu> all) {
        List<TreeNode<Long>> nodeList = CollUtil.newArrayList();
        for (var menu : all) {
            var treeNode = new TreeNode<>(menu.getId(), menu.getParentId(), menu.getName(), menu.getSort());
            var extra = new HashMap<String, Object>();
            extra.put("path", menu.getPath());
            extra.put("icon", menu.getIcon());
            extra.put("component", menu.getComponent());
            if (0 == menu.getType()) {
                extra.put("component", "Layout");
                extra.put("path", "/" + menu.getPath());
            }
            extra.put("permission", menu.getPermission());
            extra.put("sort", menu.getSort());
            extra.put("type", menu.getType());
            extra.put("createTime", menu.getCreateTime());
            extra.put("meta", new MenuMetaVo(menu.getName(), menu.getIcon(), true));
            treeNode.setExtra(extra);
            nodeList.add(treeNode);
        }
        return TreeUtil.build(nodeList, -1L);
    }

    @Override
    public Map<String, Object> getByRoleId(long id) {
        Map<String, Object> map = new HashMap<>();
        List<SysMenu> all = baseMapper.selectList(Wrappers.emptyWrapper());
        List<TreeNode<Long>> nodeList = CollUtil.newArrayList();
        for (var menu : all) {
            var treeNode = new TreeNode<>(menu.getId(), menu.getParentId(), menu.getName(), menu.getSort());
            nodeList.add(treeNode);
        }
        map.put("menus", TreeUtil.build(nodeList, -1L));
        map.put("checkedKeys", baseMapper.getByRoleId(id));
        return map;
    }

    @Override
    @Cacheable(value = RedisKeyConstant.ROLE_MENU, key = "#roleId")
    public List<SysMenu> findMenuByRoleId(Long roleId) {
        return baseMapper.findMenuByRoleId(roleId);
    }

    @Override
    public List<Tree<Long>> getUserMenus() {
        var all = new ArrayList<SysMenu>();
        var roleIds = roleService.findRolesByUserId(StpUtil.getLoginIdAsLong()).stream().map(SysRole::getId)
                .collect(Collectors.toList());
        roleIds.forEach(roleId -> {
            var collect = findMenuByRoleId(roleId).stream()
                    .filter(permission -> 2 != permission.getType())
                    .collect(Collectors.toList());
            all.addAll(collect);
        });
        var personSet = new TreeSet<SysMenu>(Comparator.comparing(BaseEntity::getId));
        personSet.addAll(all);
        return tree(personSet);
    }
}
