package com.ddcat.service;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ddcat.entity.user.*;

/**
 * @author dd-cat
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 保存or修改
     *
     * @param dto -
     */
    void saveOrUpdate(UserDTO dto);

    /**
     * 分页查询
     *
     * @param dto -
     * @return -
     */
    IPage<UserPageVO> page(UserPageDTO dto);

    /**
     * 用户登录
     *
     * @param dto -
     * @return -
     */
    SaTokenInfo login(UserLoginDTO dto);

    /**
     * 在线用户列表
     *
     * @param dto -
     * @return -
     */
    IPage<UserOnlineListVO> online(UserOnlineListDTO dto);

    /**
     * 当前登录用户信息
     *
     * @return -
     */
    UserLoginVO info();

    /**
     * 修改当前登陆人密码
     *
     * @param dto -
     */
    void updatePassword(UserPasswordDTO dto);

    /**
     * 删除
     *
     * @param id -
     */
    void removeById(long id);

    /**
     * 用户信息
     *
     * @param id -
     * @return -
     */
    UserVo selectId(long id);
}
