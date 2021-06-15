package com.ddcat.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.base.BaseService;
import com.ddcat.entity.SysDept;
import com.ddcat.entity.vo.dept.DeptPageRequest;
import com.ddcat.entity.vo.dept.DeptSaveRequest;

import java.util.List;
import java.util.Set;

/**
 * @author dd-cat
 */
public interface SysDeptService extends BaseService<SysDept> {
    /**
     * 获取树形数据
     *
     * @return -
     */
    List<Tree<Long>> tree(Set<SysDept> all);

    /**
     * 保存
     *
     * @param r -
     */
    void save(DeptSaveRequest r);

    /**
     * 分页查询
     *
     * @param r -
     * @return -
     */
    IPage<SysDept> page(DeptPageRequest r);

}