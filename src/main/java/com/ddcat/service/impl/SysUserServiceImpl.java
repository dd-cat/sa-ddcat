package com.ddcat.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.NumberUtil;
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
import com.ddcat.entity.vo.user.*;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysDeptMapper;
import com.ddcat.mapper.SysUserMapper;
import com.ddcat.menu.ResultEnum;
import com.ddcat.netty.NettyHandler;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import com.ddcat.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends BaseServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Value("${password:e10adc3949ba59abbe56e057f20f883e}")
    private String password;

    private final SysDeptMapper deptMapper;
    private final SysRoleService roleService;
    private final SysMenuService menuService;

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
        Long deptId = r.getDeptId();
        if (deptId != null) {
            deptMapper.selectTreeId(deptId);
        }
        return baseMapper.page(new Page<>(r.getCurrent(), r.getSize()), r, ids);
    }

    @Override
    public UserLoginResponse login(UserLoginRequest r) {
        LambdaQueryWrapper<SysUser> query;
        boolean number = NumberUtil.isNumber(r.getAccount());
        if (number) {
            query = Wrappers.<SysUser>lambdaQuery().eq(StrUtil.isNotBlank(r.getAccount()), SysUser::getMobile, r.getAccount());
        } else {
            query = Wrappers.<SysUser>lambdaQuery().eq(StrUtil.isNotBlank(r.getAccount()), SysUser::getAccount, r.getAccount());
        }
        SysUser entity = baseMapper.selectOne(query);
        // 用户不存在
        if (entity == null) {
            throw new BusinessException(ResultEnum.S000001);
        }
        if (!number) {
            String md5Str = SecureUtil.md5(r.getPassword());
            if (!entity.getPassword().equals(md5Str)) {
                throw new BusinessException(ResultEnum.S000002);
            }
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
        return new UserLoginResponse(entity, new ArrayList<>(permissions), StpUtil.getTokenInfo());
    }

    @Override
    public IPage<UserOnlineListResponse> online(UserOnlineListRequest r) {
        Map<String, String> dataMap = NettyHandler.dataMap;
        List<String> ids = new ArrayList<>(dataMap.values());
        if (ids.size() <= 0) {
            ids.add("0");
        }
        return baseMapper.onlinePage(new Page<>(r.getCurrent(), r.getSize()), r, ids);
    }
}