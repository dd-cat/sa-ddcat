package com.ddcat.mapper;

import com.ddcat.base.SuperMapper;
import com.ddcat.entity.dept.SysDept;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysDeptMapper extends SuperMapper<SysDept> {
    /**
     * 获取sort值
     *
     * @param parentId -
     * @return -
     */
    @Select("<script>" +
            "select sort from dept where state = 0" +
            "<if test='parentId == null'>" +
            "and parent_id IS NULL" +
            "</if>" +
            "<if test='parentId != null'>" +
            "and parent_id = ${parentId}" +
            "</if>" +
            "limit 1" +
            "</script>")
    Integer getSort(long parentId);

    /**
     * 获取当前节点下所有节点ID
     *
     * @param deptId 部门ID
     * @return -
     */
    List<Long> selectTreeId(Long deptId);

}
