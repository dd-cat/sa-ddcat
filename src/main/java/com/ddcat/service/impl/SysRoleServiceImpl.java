package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.text.CharSequenceUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.role.RoleDTO;
import com.ddcat.entity.role.RolePageDTO;
import com.ddcat.entity.role.SysRole;
import com.ddcat.enums.ResultEnum;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysRoleMapper;
import com.ddcat.service.SysRoleService;
import org.springframework.cache.annotation.CacheEvict;
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
        Page<SysRole> page = new Page<>(dto.getCurrent(), dto.getSize());
        // 构建查询条件
        LambdaQueryWrapper<SysRole> queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .select(SysRole::getId, SysRole::getCode, SysRole::getName, SysRole::getRemark)
                .like(CharSequenceUtil.isNotBlank(dto.getName()), SysRole::getName, dto.getName())
                .like(CharSequenceUtil.isNotBlank(dto.getCode()), SysRole::getCode, dto.getCode())
                .like(CharSequenceUtil.isNotBlank(dto.getRemark()), SysRole::getRemark, dto.getRemark());
        return baseMapper.selectPage(page, queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = RedisKeyConstant.ROLE_MENU, key = "#r.id", condition = "#r.menuIds.length > 0")
    public void saveOrUpdate(RoleDTO r) {
        LambdaQueryWrapper<SysRole> queryWrapper = Wrappers.<SysRole>lambdaQuery()
                .eq(SysRole::getCode, r.getCode())
                //排除系统管理员不允许修改 前端做置灰操作，所以这里就返回报错了
                .ne(SysRole::getCode, "admin");
        if (r.getId() != null) {
            queryWrapper.ne(SysRole::getId, r.getId());
        }
        Integer count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000006);
        }
        SysRole entity = new SysRole();
        BeanUtil.copyProperties(r, entity);
        super.saveOrUpdate(entity);
        long[] menuIds = r.getMenuIds();
        if (menuIds.length > 0) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuByRoleId(entity.getId());
            // 新增当前角色拥有权限
            baseMapper.batchRoleMenu(entity.getId(), menuIds);
        }
    }

    @Override
    @CacheEvict(value = RedisKeyConstant.ROLE_MENU, key = "#id")
    public void removeById(long id) {
        SysRole role = baseMapper.selectById(id);
        if (role == null) {
            throw new BusinessException(ResultEnum.B000014);
        }
        if (role.getCode().equals("admin")) {
            throw new BusinessException(ResultEnum.B000015);
        }
        // 查询是否有用户关联角色
        int count = baseMapper.getUserCount(id);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000012);
        }
        int delCount = baseMapper.deleteById(id);
        if (delCount > 0) {
            // 清除当前角色拥有权限
            baseMapper.deleteMenuByRoleId(id);
        }

    }

    @Override
    public List<SysRole> findRolesByUserId(Long userId) {
        return baseMapper.listRolesByUserId(userId);
    }
}
