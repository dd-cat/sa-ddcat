package com.ddcat.config;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.router.SaRouterUtil;
import cn.dev33.satoken.stp.StpUtil;
import com.ddcat.entity.common.Result;
import org.springframework.context.annotation.Bean;

/**
 * [Sa-Token 权限认证] 配置类
 *
 * @author kong
 */
//@Configuration
public class SaTokenConfigure {

    /**
     * 注册 [sa-token全局过滤器]
     */
    @Bean
    public SaServletFilter getSaServletFilter() {
        return new SaServletFilter()

                // 指定 拦截路由 与 放行路由
                .addInclude("/**").addExclude("/favicon.ico")

                // 认证函数: 每次请求执行
                .setAuth(r -> {
                    // 登录验证 -- 拦截所有路由，并排除/user/doLogin 用于开放登录
                    SaRouterUtil.match("/**", "/user/login", StpUtil::checkLogin);

                    // 更多拦截处理方式，请参考“路由拦截式鉴权”章节
                })

                // 异常处理函数：每次认证函数发生异常时执行此函数
                .setError(e -> Result.fail(e.getMessage()))

                // 前置函数：在每次认证函数之前执行
                .setBeforeAuth(r -> {
                    // ---------- 设置一些安全响应头 ----------
                    SaHolder.getResponse()
                            // 服务器名称
                            .setServer("sa-server")
                            // 是否可以在iframe显示视图： DENY=不可以 | SAMEORIGIN=同域下可以 | ALLOW-FROM uri=指定域名下可以
                            .setHeader("X-Frame-Options", "SAMEORIGIN")
                            // 是否启用浏览器默认XSS防护： 0=禁用 | 1=启用 | 1; mode=block 启用, 并在检查到XSS攻击时，停止渲染页面
                            .setHeader("X-Frame-Options", "1; mode=block")
                            // 禁用浏览器内容嗅探
                            .setHeader("X-Content-Type-Options", "nosniff");
                });
    }

}

