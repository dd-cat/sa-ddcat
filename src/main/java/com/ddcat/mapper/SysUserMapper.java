package com.ddcat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.entity.user.*;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

/**
 * @author dd-cat
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

    /**
     * 查询数据
     *
     * @param page -
     * @param dto  -
     * @param ids  -
     * @return -
     */
    IPage<UserPageVO> page(Page<?> page, @Param("dto") UserPageDTO dto, @Param("ids") List<Long> ids);

    /**
     * 在线用户列表
     *
     * @param page -
     * @param dto  -
     * @param ids  -
     * @return -
     */
    IPage<UserOnlineListVO> onlinePage(Page<?> page, @Param("dto") UserOnlineListDTO dto, @Param("ids") Set<String> ids);

    /**
     * 添加用户角色
     *
     * @param userId -
     */
    @Insert({"<script>" +
            "insert into sys_user_role(user_id, role_id) values " +
            "<foreach collection=\"roleIds\" item=\"item\" index=\"index\" separator=\",\">" +
            " (${userId},${item})\n" +
            "</foreach>" +
            "</script>"})
    void batchUserRole(long userId, long[] roleIds);

    /**
     * 删除用户角色关联
     *
     * @param userId -
     */
    @Delete("delete from sys_user_role where user_id = ${userId}")
    void deleteUserRoleById(long userId);

    /**
     * 查询当前用户拥有的角色 ID
     *
     * @param id -
     * @return -
     */
    @Select("select role_id from sys_user_role where user_id = ${id}")
    Long[] selectRoleIdsByUserId(long id);
}
