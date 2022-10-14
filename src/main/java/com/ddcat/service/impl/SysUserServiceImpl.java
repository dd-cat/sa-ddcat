package com.ddcat.service.impl;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.IdcardUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.menu.SysMenu;
import com.ddcat.entity.role.SysRole;
import com.ddcat.entity.user.*;
import com.ddcat.enums.ResultEnum;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysDeptMapper;
import com.ddcat.mapper.SysUserMapper;
import com.ddcat.netty.NettyChannelPool;
import com.ddcat.service.SysMenuService;
import com.ddcat.service.SysRoleService;
import com.ddcat.service.SysUserService;
import io.netty.channel.Channel;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Value("${password:e10adc3949ba59abbe56e057f20f883e}")
    private String password;

    private final SysDeptMapper deptMapper;
    private final SysRoleService roleService;
    private final SysMenuService menuService;

    @Override
    public void saveOrUpdate(UserDTO dto) {
        // 验证账号是否已经存在
        LambdaQueryWrapper<SysUser> queryWrapper = Wrappers.<SysUser>lambdaQuery()
                .eq(SysUser::getAccount, dto.getAccount());
        if (dto.getId() != null) {
            queryWrapper.ne(SysUser::getId, dto.getId());
        }
        Integer count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000003);
        }
        // 验证身份证信息
        if (CharSequenceUtil.isNotBlank(dto.getIdCard())) {
            boolean validCard = IdcardUtil.isValidCard(dto.getIdCard());
            if (!validCard) {
                throw new BusinessException(ResultEnum.B000004);
            }
        }
        SysUser entity = new SysUser();
        BeanUtil.copyProperties(dto, entity);
        if (entity.getId() == null) {
            // 初始化密码
            entity.setPassword(password);
        }
        super.saveOrUpdate(entity);
        // 加载用户角色
        setUserRole(dto.getRoleIds(), entity.getId());
        //重新缓存用户信息
        StpUtil.getTokenSession().set(RedisKeyConstant.USER, entity);
    }

    /**
     * 重新加载用户角色信息
     *
     * @param id -
     */
    private void setUserRole(long[] roleIds, Long id) {
        if (roleIds.length > 0) {
            baseMapper.deleteRoleByUserId(id);
            baseMapper.batchUserRole(id, roleIds);
        }
    }

    @Override
    public IPage<UserPageVO> page(UserPageDTO dto) {
        List<Long> ids = new ArrayList<>();
        Long deptId = dto.getDeptId();
        if (deptId != null) {
            ids = deptMapper.selectTreeId(deptId);
            ids.add(dto.getDeptId());
        }
        return baseMapper.page(new Page<>(dto.getCurrent(), dto.getSize()), dto, ids);
    }

    @Override
    public SaTokenInfo login(UserLoginDTO dto) {
        LambdaQueryWrapper<SysUser> query = Wrappers.<SysUser>lambdaQuery();
        boolean number = NumberUtil.isNumber(dto.getKey());
        if (number) {
            query.eq(CharSequenceUtil.isNotBlank(dto.getKey()), SysUser::getMobile, dto.getKey());
        } else {
            query.eq(CharSequenceUtil.isNotBlank(dto.getKey()), SysUser::getAccount, dto.getKey());
        }
        SysUser entity = baseMapper.selectOne(query);
        // 用户不存在
        if (entity == null) {
            throw new BusinessException(ResultEnum.S000001);
        }
        if (!number) {
            String md5Str = SecureUtil.md5(dto.getPassword());
            if (!entity.getPassword().equals(md5Str)) {
                throw new BusinessException(ResultEnum.S000002);
            }
        }
        //登录
        StpUtil.login(entity.getId());
        //缓存用户信息
        StpUtil.getTokenSession().set(RedisKeyConstant.USER, entity);
        return StpUtil.getTokenInfo();
    }

    @Override
    public IPage<UserOnlineListVO> online(UserOnlineListDTO dto) {
        Map<String, Channel> dataMap = NettyChannelPool.userChannelMap;
        Set<String> ids = dataMap.keySet();
        if (ids.isEmpty()) {
            ids = new HashSet<>();
            ids.add("0");
        }
        return baseMapper.onlinePage(new Page<>(dto.getCurrent(), dto.getSize()), dto, ids);
    }

    @Override
    public UserLoginVO info() {
        SysUser entity = baseMapper.selectById(StpUtil.getLoginIdAsLong());
        Set<String> permissions = new HashSet<>();
        //通过用户角色ID 获取用户权限列表
        List<SysRole> roles = roleService.findRolesByUserId(entity.getId());

        List<String> roleCodes = roles.stream().map(SysRole::getCode).collect(Collectors.toList());

        List<Long> roleIds = roles.stream().map(SysRole::getId).collect(Collectors.toList());
        roleIds.forEach(roleId -> {
            List<String> permissionList = menuService.findMenuByRoleId(roleId).stream()
                    .map(SysMenu::getPermission).filter(StrUtil::isNotEmpty)
                    .collect(Collectors.toList());
            permissions.addAll(permissionList);
        });
        return new UserLoginVO(entity, new ArrayList<>(permissions), roleCodes);
    }

    @Override
    public void updatePassword(UserPasswordDTO dto) {
        SysUser user = baseMapper.selectById(StpUtil.getLoginIdAsLong());
        // 判断旧密码 和 原密码是否一致
        if (!user.getPassword().equals(SecureUtil.md5(dto.getOldPassword()))) {
            throw new BusinessException(ResultEnum.B000005);
        }
        user.setPassword(SecureUtil.md5(dto.getNewPassword()));
        baseMapper.updateById(user);
        // 修改完密码后注销
        StpUtil.logout();
    }

    @Override
    public void removeById(long id) {
        long loginId = StpUtil.getLoginIdAsLong();
        if (id == loginId) {
            throw new BusinessException(ResultEnum.B000002);
        }
        int i = baseMapper.deleteById(id);
        // 删除用户角色关联
        if (i > 0) {
            baseMapper.deleteRoleByUserId(id);
        }
    }

    @Override
    public UserVo selectId(long id) {
        UserVo vo = new UserVo();
        SysUser user = baseMapper.selectById(id);
        BeanUtil.copyProperties(user, vo);
        Long[] roleIds = baseMapper.selectRoleIdsByUserId(id);
        vo.setRoleIds(roleIds);
        return vo;
    }
}
