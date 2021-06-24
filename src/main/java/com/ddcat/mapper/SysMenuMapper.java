package com.ddcat.mapper;

import com.ddcat.base.SuperMapper;
import com.ddcat.entity.menu.SysMenu;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysMenuMapper extends SuperMapper<SysMenu> {

    /**
     * 通过角色ID获取菜单ID
     *
     * @param id -
     * @return -
     */
    @Select("select menu_id from sys_role_menu where role_id=#{id}")
    List<Long> getByRoleId(long id);

    /**
     * 通过角色编号查询菜单
     *
     * @param roleId 角色ID
     * @return List<SysMenu>
     */
    List<SysMenu> findMenuByRoleId(Long roleId);
}
