package com.ddcat.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.SysDept;
import com.ddcat.entity.vo.dept.DeptPageRequest;
import com.ddcat.entity.vo.dept.DeptSaveRequest;
import com.ddcat.mapper.SysDeptMapper;
import com.ddcat.service.SysDeptService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * @author dd-cat
 */
@Service
public class SysDeptServiceImpl extends BaseServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {
    @Override
    public List<Tree<Long>> tree(Set<SysDept> all) {
        List<TreeNode<Long>> nodeList = CollUtil.newArrayList();
        for (SysDept dept : all) {
            TreeNode<Long> treeNode = new TreeNode<>(dept.getId(), dept.getParentId(), dept.getName(), dept.getSort());
            nodeList.add(treeNode);
        }
        return TreeUtil.build(nodeList, -1L);
    }

    @Override
    public void save(DeptSaveRequest r) {
        SysDept entity = new SysDept();
        BeanUtil.copyProperties(r, entity);
        // 新增则获取当前兄弟节点最后一个排序值加1作为sort值
        if (entity.getId() == null) {
            Integer sort = baseMapper.getSort(entity.getParentId());
            entity.setSort(sort == null ? 0 : sort + 1);
            baseMapper.insert(entity);
        } else {
            baseMapper.updateById(entity);
        }
    }

    @Override
    public IPage<SysDept> page(DeptPageRequest r) {
        return this.page(new Page<>(r.getCurrent(), r.getSize()));
    }

}
