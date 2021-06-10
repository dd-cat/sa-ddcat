package com.ddcat.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.base.BaseService;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.vo.user.*;

import java.util.List;

/**
 * @author dd-cat
 */
public interface SysUserService extends BaseService<SysUser> {

    /**
     * 保存or修改
     *
     * @param r -
     */
    void saveOrUpdate(UserSaveRequest r);

    /**
     * 分页查询
     *
     * @param r -
     * @return -
     */
    IPage<UserPageResponse> page(UserPageRequest r);

    /**
     * 用户登录
     *
     * @param r -
     * @return -
     */
    UserLoginResponse login(UserLoginRequest r) throws Exception;

    /**
     * 在线用户列表
     *
     * @param r -
     * @return -
     */
    List<UserOnlineListResponse> online(UserOnlineListRequest r);
}