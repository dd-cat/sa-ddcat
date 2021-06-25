package com.ddcat.mapper;

import com.ddcat.base.SuperMapper;
import com.ddcat.entity.dept.SysDept;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysDeptMapper extends SuperMapper<SysDept> {

    /**
     * 获取当前节点下所有节点ID
     *
     * @param deptId 部门ID
     * @return -
     */
    List<Long> selectTreeId(Long deptId);

}
