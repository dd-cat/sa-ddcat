package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.text.CharSequenceUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.entity.role.RoleDTO;
import com.ddcat.entity.role.RolePageDTO;
import com.ddcat.entity.role.SysRole;
import com.ddcat.enums.ResultEnum;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysRoleMapper;
import com.ddcat.service.SysRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author dd-cat
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Override
    public IPage<SysRole> page(RolePageDTO dto) {
        var page = new Page<SysRole>(dto.getCurrent(), dto.getSize());
        // 构建查询条件
        var queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .like(CharSequenceUtil.isNotBlank(dto.getName()), SysRole::getName, dto.getName())
                .like(CharSequenceUtil.isNotBlank(dto.getCode()), SysRole::getCode, dto.getCode())
                .like(CharSequenceUtil.isNotBlank(dto.getRemark()), SysRole::getRemark, dto.getRemark());
        return super.page(page, queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(RoleDTO r) {
        var queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .eq(SysRole::getCode, r.getCode());
        if (r.getId() != null) {
            queryWrapper.ne(SysRole::getId, r.getId());
        }
        var count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000006);
        }

        var entity = new SysRole();
        BeanUtil.copyProperties(r, entity);
        super.saveOrUpdate(entity);
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
        // 查询是否有用户关联角色
        var count = baseMapper.getUserCount(id);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000012);
        }
        var delCount = baseMapper.deleteById(id);
        if (delCount > 0) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuById(id);
        }
    }

    @Override
    public List<SysRole> findRolesByUserId(Long userId) {
        return baseMapper.listRolesByUserId(userId);
    }
}
