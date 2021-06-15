package com.ddcat.mapper;

import com.ddcat.base.SuperMapper;
import com.ddcat.entity.SysDept;
import com.ddcat.entity.vo.dept.DeptPageRequest;
import com.ddcat.entity.vo.dept.DeptPageResponse;
import org.apache.ibatis.annotations.Param;
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
     * 查询数据
     *
     * @param r   -
     * @param ids -
     * @return -
     */
    List<DeptPageResponse> list(@Param("r") DeptPageRequest r, @Param("ids") List<Long> ids);


    /**
     * 获取当前节点下所有节点ID
     *
     * @return -
     */
    List<Long> selectTreeId(Long deptId);

}