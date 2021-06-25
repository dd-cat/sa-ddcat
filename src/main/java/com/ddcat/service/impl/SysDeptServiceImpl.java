package com.ddcat.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.BaseServiceImpl;
import com.ddcat.entity.dept.DeptPageDTO;
import com.ddcat.entity.dept.SysDept;
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

}
