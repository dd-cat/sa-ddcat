package com.ddcat.service.impl;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdcardUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.menu.SysMenu;
import com.ddcat.entity.role.SysRole;
import com.ddcat.entity.user.*;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysDeptMapper;
import com.ddcat.mapper.SysUserMapper;
import com.ddcat.menu.ResultEnum;
import com.ddcat.netty.NettyChannelPool;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import com.ddcat.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
    public void saveOrUpdate(UserDTO dto) {
        // 验证账号是否已经存在
        var queryWrapper = Wrappers.<SysUser>lambdaQuery()
                .eq(SysUser::getAccount, dto.getAccount());
        if (dto.getId() != null) {
            queryWrapper.ne(SysUser::getId, dto.getId());
        }
        var count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000003);
        }
        // 验证身份证信息
        if (!dto.getIdCard().isBlank()) {
            boolean validCard = IdcardUtil.isValidCard(dto.getIdCard());
            if (!validCard) {
                throw new BusinessException(ResultEnum.B000004);
            }
        }
        var entity = new SysUser();
        BeanUtil.copyProperties(dto, entity);
        if (entity.getId() == null) {
            // 初始化密码
            entity.setPassword(password);
        }
        super.saveOrUpdate(entity);
        //重新缓存用户信息
        StpUtil.getTokenSession().setAttribute(RedisKeyConstant.USER, entity);
    }

    @Override
    public IPage<UserPageVO> page(UserPageDTO dto) {
        List<Long> ids = new ArrayList<>();
        var deptId = dto.getDeptId();
        if (deptId != null) {
            ids = deptMapper.selectTreeId(deptId);
        }
        return baseMapper.page(new Page<>(dto.getCurrent(), dto.getSize()), dto, ids);
    }

    @Override
    public SaTokenInfo login(UserLoginDTO dto) {
        var query = Wrappers.<SysUser>lambdaQuery();
        var number = NumberUtil.isNumber(dto.getKey());
        if (number) {
            query.eq(!dto.getKey().isBlank(), SysUser::getMobile, dto.getKey());
        } else {
            query.eq(!dto.getKey().isBlank(), SysUser::getAccount, dto.getKey());
        }
        var entity = baseMapper.selectOne(query);
        // 用户不存在
        if (entity == null) {
            throw new BusinessException(ResultEnum.S000001);
        }
        if (!number) {
            var md5Str = SecureUtil.md5(dto.getPassword());
            if (!entity.getPassword().equals(md5Str)) {
                throw new BusinessException(ResultEnum.S000002);
            }
        }
        //登录
        StpUtil.login(entity.getId());
        //缓存用户信息
        StpUtil.getTokenSession().setAttribute(RedisKeyConstant.USER, entity);
        return StpUtil.getTokenInfo();
    }

    @Override
    public IPage<UserOnlineListVO> online(UserOnlineListDTO dto) {
        var dataMap = NettyChannelPool.userChannelMap;
        var ids = dataMap.keySet();
        if (ids.isEmpty()) {
            ids = new HashSet<>();
            ids.add("0");
        }
        return baseMapper.onlinePage(new Page<>(dto.getCurrent(), dto.getSize()), dto, ids);
    }

    @Override
    public UserLoginVO info() {
        var entity = this.getById(StpUtil.getLoginIdAsLong());
        var permissions = new HashSet<String>();
        //通过用户角色ID 获取用户权限列表
        var roles = roleService.findRolesByUserId(entity.getId());

        var roleCodes = roles.stream().map(SysRole::getCode).collect(Collectors.toList());

        var roleIds = roles.stream().map(SysRole::getId).collect(Collectors.toList());
        roleIds.forEach(roleId -> {
            var permissionList = menuService.findMenuByRoleId(roleId).stream()
                    .map(SysMenu::getPermission).filter(StrUtil::isNotEmpty)
                    .collect(Collectors.toList());
            permissions.addAll(permissionList);
        });
        return new UserLoginVO(entity, new ArrayList<>(permissions), roleCodes);
    }

    @Override
    public void updatePassword(UserPasswordDTO dto) {
        var user = baseMapper.selectById(StpUtil.getLoginIdAsLong());
        // 判断旧密码 和 原密码是否一致
        if (!user.getPassword().equals(SecureUtil.md5(dto.getOldPassword()))) {
            throw new BusinessException(ResultEnum.B000005);
        }
        user.setPassword(SecureUtil.md5(dto.getNewPassword()));
        baseMapper.updateById(user);
        // 修改完密码后注销
        StpUtil.logout();
    }
}
