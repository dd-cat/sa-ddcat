package com.ddcat.controller;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.ddcat.annotation.Log;
import com.ddcat.entity.user.UserLoginDTO;
import com.ddcat.service.SysUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @author dd-cat
 */
@RequestMapping("auth")
@RestController
@RequiredArgsConstructor
public class SysLoginController {
    private final SysUserService service;

    /**
     * 用户认证
     */
    @Log("用户认证")
    @PostMapping("login")
    public SaTokenInfo login(@Valid @RequestBody UserLoginDTO dto) {
        return service.login(dto);
    }

    /**
     * 用户退出登录
     */
    @DeleteMapping("logout")
    public void logout() {
        StpUtil.logout();
    }

}
