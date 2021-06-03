package com.ddcat.entity.vo.user;

import cn.dev33.satoken.stp.SaTokenInfo;
import com.ddcat.entity.SysUser;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * @author dd-cat
 */
@Data
@AllArgsConstructor
public class UserLoginResponse {
    /**
     * 用户信息
     */
    private SysUser user;
    /**
     * 权限集合
     */
    private List<String> permissions;
    /**
     * token信息
     */
    private SaTokenInfo tokenInfo;
}