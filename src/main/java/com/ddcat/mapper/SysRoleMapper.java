package com.ddcat.mapper;

import com.ddcat.base.SuperMapper;
import com.ddcat.entity.SysRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysRoleMapper extends SuperMapper<SysRole> {
    /**
     * 清除当前用户拥有权限
     *
     * @param roleId -
     * @return -
     */
    @Delete("delete from role_permission where role_id = ${roleId}")
    long deleteMenuById(long roleId);

    /**
     * 新增当前用户拥有权限
     *
     * @param roleId        -
     * @param permissionIds -
     * @return -
     */
    @Insert("<script>" +
            "insert into role_permission(role_id, permission_id) value" +
            "<foreach collection='permissionIds' item='permissionId' separator=','>" +
            "(${roleId},${permissionId})" +
            "</foreach>" +
            "</script>")
    long insertMenu(@Param("roleId") long roleId, @Param("permissionIds") long[] permissionIds);

    /**
     * 通过用户ID，查询角色信息
     *
     * @param userId 用户id
     * @return -
     */
    List<SysRole> listRolesByUserId(Long userId);
}