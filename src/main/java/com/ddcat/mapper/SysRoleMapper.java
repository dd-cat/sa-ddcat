package com.ddcat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ddcat.entity.role.SysRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {
    /**
     * 清除当前用户拥有权限
     *
     * @param roleId -
     * @return -
     */
    @Delete("delete from role_menu where role_id = ${roleId}")
    long deleteMenuById(long roleId);

    /**
     * 新增当前用户拥有权限
     *
     * @param roleId        -
     * @param permissionIds -
     * @return -
     */
    @Insert("<script>" +
            "insert into role_menu(role_id, permission_id) value" +
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

    /**
     * 查询是否有用户关联角色
     *
     * @param id -
     * @return -
     */
    @Select("select count(*) from user_role a inner join user b on a.user_id=b.id and b.flag=0 where a.role_id = #{id}")
    int getUserCount(long id);
}
