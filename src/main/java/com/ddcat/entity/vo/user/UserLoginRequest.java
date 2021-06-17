package com.ddcat.entity.vo.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author dd-cat
 */
@Data
public class UserLoginRequest {
    /**
     * 账号 可以是手机号、账号等
     */
    @NotBlank(message = "账号必填")
    private String key;
    /**
     * 密码
     */
    private String password;
}
