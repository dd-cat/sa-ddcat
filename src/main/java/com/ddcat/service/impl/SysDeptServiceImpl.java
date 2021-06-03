package com.ddcat.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ddcat.entity.SysDept;
import com.ddcat.entity.common.PageEntity;
import com.ddcat.entity.vo.dept.DeptPageRequest;
import com.ddcat.entity.vo.dept.DeptPageResponse;
import com.ddcat.entity.vo.dept.DeptSaveRequest;
import com.ddcat.mapper.SysDeptMapper;
import com.ddcat.service.SysDeptService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author dd-cat
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

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
        BeanUtils.copyProperties(r, entity);
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
    public PageEntity<DeptPageResponse> page(DeptPageRequest r) {
        List<Long> ids = new ArrayList<>();
        Long parentId = r.getParentId();
        /*if (parentId != null) {
            TreeBaseEntity.recursionTreeId(parentId, ids, this.list());
        }*/
        r.calcPageNum();
        long count = baseMapper.count(r, ids);
        if (count == 0) {
            return new PageEntity<>(ListUtil.empty(), count);
        }
        return new PageEntity<>(baseMapper.list(r, ids), count);
    }

}