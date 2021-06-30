package com.ddcat.util;

import cn.dev33.satoken.stp.StpUtil;
import com.ddcat.constant.RedisKeyConstant;
import com.ddcat.entity.user.SysUser;
import lombok.experimental.UtilityClass;

/**
 * @author dd-cat
 */
@UtilityClass
public class UserUtil {
    /**
     * 获取当前登录用户ID
     *
     * @return -
     */
    public Long getUserId() {
        return StpUtil.getLoginIdAsLong();
    }

    /**
     * 获取当前登录用户
     *
     * @return -
     */
    public SysUser getUser() {
        return StpUtil.getTokenSession().getModel(RedisKeyConstant.USER, SysUser.class);
    }
}
