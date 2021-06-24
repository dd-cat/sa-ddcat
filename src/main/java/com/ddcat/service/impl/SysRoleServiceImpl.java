package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.role.RolePageDTO;
import com.ddcat.entity.role.RoleSaveDTO;
import com.ddcat.entity.role.SysRole;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysRoleMapper;
import com.ddcat.menu.ResultEnum;
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
    public IPage<SysRole> page(RolePageDTO dto) {
        var page = new Page<SysRole>(dto.getCurrent(), dto.getSize());
        // 构建查询条件
        var queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .like(!dto.getName().isBlank(), SysRole::getName, dto.getName())
                .like(!dto.getCode().isBlank(), SysRole::getCode, dto.getCode())
                .like(!dto.getRemark().isBlank(), SysRole::getRemark, dto.getRemark());
        return this.page(page, queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(RoleSaveDTO r) {
        var queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .eq(SysRole::getCode, r.getCode());
        if (r.getId() != null) {
            queryWrapper.ne(SysRole::getId, r.getId());
        }
        Integer count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000006);
        }

        var entity = new SysRole();
        BeanUtil.copyProperties(r, entity);
        saveOrUpdate(entity);
        var permissionIds = r.getPermissionIds();
        if (permissionIds.length > 0) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuById(entity.getId());
            // 新增当前角色拥有权限
            baseMapper.insertMenu(entity.getId(), permissionIds);
        }
    }

    @Override
    public void removeById(long id) {
        var count = baseMapper.deleteById(id);
        if (count > 0) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuById(id);
        }
    }

    @Override
    public List<SysRole> findRolesByUserId(Long userId) {
        return baseMapper.listRolesByUserId(userId);
    }
}
