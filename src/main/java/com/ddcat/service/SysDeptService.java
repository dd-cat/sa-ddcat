package com.ddcat.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.base.BaseService;
import com.ddcat.entity.dept.DeptPageDTO;
import com.ddcat.entity.dept.DeptSaveDTO;
import com.ddcat.entity.dept.SysDept;

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
     * @param dto -
     */
    void save(DeptSaveDTO dto);

    /**
     * 分页查询
     *
     * @param dto -
     * @return -
     */
    IPage<SysDept> page(DeptPageDTO dto);

}
