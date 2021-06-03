package com.ddcat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.SysMenu;
import com.ddcat.entity.SysRole;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.common.TreeBaseEntity;
import com.ddcat.entity.vo.user.*;
import com.ddcat.mapper.SysUserMapper;
import com.ddcat.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends BaseServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Value("${password:e10adc3949ba59abbe56e057f20f883e}")
    private String password;

    private final SysDeptService deptService;
    private final SysRoleService roleService;
    private final SysMenuService menuService;
    private final SysLogService logService;

    @Override
    public void saveOrUpdate(UserSaveRequest r) {
        SysUser entity = new SysUser();
        BeanUtils.copyProperties(r, entity);
        if (StrUtil.isNotBlank(entity.getPassword())) {
            //密码加密
            entity.setPassword(SecureUtil.md5(entity.getPassword()));
        }
        if (entity.getId() == null) {
            //初始密码
            entity.setPassword(password);
        }
        this.saveOrUpdate(entity);
    }

    @Override
    public IPage<UserPageResponse> page(UserPageRequest r) {
        List<Long> ids = new ArrayList<>();
        Long parentId = r.getDeptId();
        if (parentId != null) {
            TreeBaseEntity.recursionTreeId(parentId, ids, deptService.list());
            ids.add(parentId);
        }
        return baseMapper.page(new Page<>(r.getCurrent(), r.getSize()), r, ids);
    }

    @Override
    public UserLoginResponse login(UserLoginRequest r) throws Exception {
        LambdaQueryWrapper<SysUser> query = Wrappers.<SysUser>lambdaQuery().eq(StrUtil.isNotBlank(r.getAccount()), SysUser::getAccount, r.getAccount());
        SysUser entity = baseMapper.selectOne(query);
        // 用户不存在
        if (entity == null) {
            throw new Exception("用户不存在！");
        }
        String md5Str = SecureUtil.md5(r.getPassword());
        if (!entity.getPassword().equals(md5Str)) {
            throw new Exception("密码输入错误");
        }
        Set<String> permissions = new HashSet<>();
        //通过用户角色ID 获取用户权限列表
        List<Long> roleIds = roleService.findRolesByUserId(entity.getId()).stream().map(SysRole::getId)
                .collect(Collectors.toList());
        roleIds.forEach(roleId -> {
            List<String> permissionList = menuService.findPermissionByRoleId(roleId).stream()
                    .map(SysMenu::getPermission).filter(StrUtil::isNotEmpty)
                    .collect(Collectors.toList());
            permissions.addAll(permissionList);
        });
        //登录
        StpUtil.setLoginId(entity.getId());
        StpUtil.getSession().setAttribute("user", entity);
        StpUtil.getSession().setAttribute("permissions", new ArrayList<>(permissions));
        return new UserLoginResponse(entity, new ArrayList<>(permissions), StpUtil.getTokenInfo());
    }
}