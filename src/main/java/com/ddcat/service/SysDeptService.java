package com.ddcat.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.base.BaseService;
import com.ddcat.entity.dept.DeptPageDTO;
import com.ddcat.entity.dept.DeptDTO;
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
     * @param all -
     * @return -
     */
    List<Tree<Long>> tree(Set<SysDept> all);


    /**
     * 分页查询
     *
     * @param dto -
     * @return -
     */
    IPage<SysDept> page(DeptPageDTO dto);

    /**
     * 保存or修改
     *
     * @param dto -
     */
    void saveOrUpdate(DeptDTO dto);

}
