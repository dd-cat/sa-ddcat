package com.ddcat.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.base.SuperMapper;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.user.UserOnlineListDTO;
import com.ddcat.entity.user.UserOnlineListVO;
import com.ddcat.entity.user.UserPageDTO;
import com.ddcat.entity.user.UserPageVO;
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
}
