package com.ddcat.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.ddcat.annotation.Log;
import com.ddcat.entity.vo.user.UserLoginRequest;
import com.ddcat.entity.vo.user.UserLoginResponse;
import com.ddcat.entity.vo.user.UserOnlineListRequest;
import com.ddcat.entity.vo.user.UserOnlineListResponse;
import com.ddcat.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

/**
 * @author dd-cat
 */
@RequestMapping("login")
@RestController
@RequiredArgsConstructor
public class LoginController {
    private final SysUserService service;

    /**
     * 用户认证
     */
    @Log("用户认证")
    @PostMapping("auth")
    public UserLoginResponse login(@Valid @RequestBody UserLoginRequest r) throws Exception {
        return service.login(r);
    }

    /**
     * 用户退出登录
     */
    @Log("用户退出登录")
    @RequestMapping("logout")
    public void isLogin() {
        StpUtil.logout();
    }

    /**
     * 在线用户列表
     *
     * @param r -
     * @return -
     */
    @PostMapping("online")
    public List<UserOnlineListResponse> online(@RequestBody UserOnlineListRequest r) {
        return service.online(r);

    }
}
