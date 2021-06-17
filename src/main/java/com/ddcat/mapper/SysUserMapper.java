package com.ddcat.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.SuperMapper;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.vo.user.UserOnlineListRequest;
import com.ddcat.entity.vo.user.UserOnlineListResponse;
import com.ddcat.entity.vo.user.UserPageRequest;
import com.ddcat.entity.vo.user.UserPageResponse;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * @author dd-cat
 */
public interface SysUserMapper extends SuperMapper<SysUser> {

    /**
     * 查询数据
     *
     * @param r -
     * @return -
     */
    IPage<UserPageResponse> page(Page<?> page, @Param("r") UserPageRequest r, @Param("ids") List<Long> ids);

    /**
     * 在线用户列表
     *
     * @param r -
     * @return -
     */
    IPage<UserOnlineListResponse> onlinePage(Page<?> page, @Param("r") UserOnlineListRequest r, @Param("ids") Set<String> ids);
}
