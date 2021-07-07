package com.ddcat.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.entity.user.*;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

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
     * 删除用户角色关联
     *
     * @param userId -
     */
    @Delete("delete from user_role where user_id = ${userId}")
    void deleteUserById(long userId);
}
