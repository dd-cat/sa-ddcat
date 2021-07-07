package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.entity.FileProperties;
import com.ddcat.entity.dept.DeptDTO;
import com.ddcat.entity.dept.DeptPageDTO;
import com.ddcat.entity.dept.SysDept;
import com.ddcat.entity.user.SysUser;
import com.ddcat.enums.ResultEnum;
import com.ddcat.exception.BusinessException;
import com.ddcat.mapper.SysDeptMapper;
import com.ddcat.mapper.SysUserMapper;
import com.ddcat.service.SysDeptService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Set;

/**
 * @author dd-cat
 */
@Service
@RequiredArgsConstructor
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {
    private final SysUserMapper userMapper;
    private final FileProperties fileProperties;

    @Override
    public List<Tree<Long>> tree(Set<SysDept> all) {
        List<TreeNode<Long>> nodeList = CollUtil.newArrayList();
        for (var dept : all) {
            var treeNode = new TreeNode<>(dept.getId(), dept.getParentId(), dept.getName(), dept.getSort());
            nodeList.add(treeNode);
        }
        return TreeUtil.build(nodeList, -1L);
    }

    @Override
    public IPage<SysDept> page(DeptPageDTO dto) {
        return super.page(new Page<>(dto.getCurrent(), dto.getSize()));
    }

    @Override
    public void saveOrUpdate(DeptDTO dto) throws IOException {
        // 机构code是否已存在
        var queryWrapper = Wrappers.<SysDept>lambdaQuery().eq(SysDept::getCode, dto.getCode());
        if (dto.getId() != null) {
            queryWrapper.ne(SysDept::getId, dto.getId());
        }
        var count = baseMapper.selectCount(queryWrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000008);
        }

        var entity = new SysDept();
        BeanUtil.copyProperties(dto, entity);
        // 部门logo
        if (dto.getAvatar() != null && !dto.getAvatar().isEmpty()) {
            String fileName = "dept" + IdUtil.simpleUUID() + "." + FileUtil.getSuffix(dto.getAvatar().getOriginalFilename());
            FileUtil.writeFromStream(dto.getAvatar().getInputStream(), fileProperties.getPath() + fileName);
            entity.setAvatar(fileProperties.getPrefix() + fileName);
        }
        this.saveOrUpdate(entity);
    }

    @Override
    public void removeById(long id) {
        // 查询是否有下级部门
        var wrapper = Wrappers.<SysDept>lambdaQuery().eq(SysDept::getParentId, id);
        var count = baseMapper.selectCount(wrapper);
        if (count > 0) {
            throw new BusinessException(ResultEnum.B000010);
        }
        // 查询部门是否有关联用户
        var queryWrapper = Wrappers.<SysUser>lambdaQuery().eq(SysUser::getDeptId, id);
        var userCount = userMapper.selectCount(queryWrapper);
        if (userCount > 0) {
            throw new BusinessException(ResultEnum.B000011);
        }
        baseMapper.deleteById(id);
    }

}
