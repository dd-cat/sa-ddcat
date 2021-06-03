package com.ddcat.entity.vo.user;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @author dd-cat
 */
@Data
public class UserLoginRequest {

    /**
     * 账户
     */
    @NotBlank(message = "账户必填")
    private String account;
    /**
     * 密码
     */
    @NotBlank(message = "密码必填")
    private String password;
}