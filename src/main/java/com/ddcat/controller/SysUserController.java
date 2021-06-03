package com.ddcat.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ddcat.annotation.Log;
import com.ddcat.entity.SysUser;
import com.ddcat.entity.vo.user.*;
import com.ddcat.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 用户
 *
 * @author dd-cat
 */
@RequestMapping("user")
@RestController
@RequiredArgsConstructor
public class SysUserController {

    private final SysUserService service;

    /**
     * 用户登录
     */
    @Log("用户登录")
    @PostMapping("login")
    public UserLoginResponse login(@Valid @RequestBody UserLoginRequest r) throws Exception {
        return service.login(r);
    }

    /**
     * 退出登录
     */
    @Log("退出登录")
    @RequestMapping("logout")
    public void isLogin() {
        StpUtil.logout();
    }

    /**
     * 保存or修改
     *
     * @param r -
     */
    @Log("用户保存or修改")
    @PostMapping
    public void saveOrUpdate(@Valid @RequestBody UserSaveRequest r) {
        service.saveOrUpdate(r);
        if (r.getId() != null && StrUtil.isNotBlank(r.getPassword())) {
            //修改了密码 注销登录
            StpUtil.logoutByLoginId(r.getId());
        }
    }

    /**
     * 分页查询
     *
     * @param r -
     */
    @Log("用户分页查询")
    @PostMapping("page")
    public IPage<UserPageResponse> page(@RequestBody UserPageRequest r) {
        return service.page(r);
    }


    /**
     * 用户删除
     */
    @Log("用户删除")
    @DeleteMapping("{id}")
    public void delete(@PathVariable long id) {
        SysUser entity = new SysUser();
        entity.setId(id);
        service.deleteByIdWithFill(entity);
    }
}