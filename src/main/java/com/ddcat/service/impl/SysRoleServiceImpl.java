package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.SysRole;
import com.ddcat.entity.vo.role.RolePageRequest;
import com.ddcat.entity.vo.role.RoleSaveRequest;
import com.ddcat.mapper.SysRoleMapper;
import com.ddcat.service.SysRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author dd-cat
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Override
    public IPage<SysRole> page(RolePageRequest r) {
        Page<SysRole> page = new Page<>(r.getCurrent(), r.getSize());
        // 构建查询条件
        LambdaQueryWrapper<SysRole> queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .like(StrUtil.isNotBlank(r.getName()), SysRole::getName, r.getName())
                .like(StrUtil.isNotBlank(r.getCode()), SysRole::getCode, r.getCode())
                .like(StrUtil.isNotBlank(r.getRemark()), SysRole::getRemark, r.getRemark());
        return this.page(page, queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(RoleSaveRequest r) {
        SysRole entity = new SysRole();
        BeanUtil.copyProperties(r, entity);
        saveOrUpdate(entity);
        long[] permissionIds = r.getPermissionIds();
        if (ArrayUtil.isNotEmpty(permissionIds)) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuById(entity.getId());
            // 新增当前角色拥有权限
            baseMapper.insertMenu(entity.getId(), permissionIds);
        }
    }

    @Override
    public void removeById(long id) {
        boolean removeFlag = super.removeById(id);
        if (removeFlag) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuById(id);
        }
    }

    @Override
    public List<SysRole> findRolesByUserId(Long userId) {
        return baseMapper.listRolesByUserId(userId);
    }
}
