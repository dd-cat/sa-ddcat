package com.ddcat.menu;

import com.ddcat.constant.Constants;
import lombok.Getter;

/**
 * @author dd-cat
 */
@Getter
public enum ResultEnum {
    SUCCESS(Constants.SUCCESS, Constants.DEFAULT_SUCCESS_MESSAGE),
    FAIL(Constants.FAIL, Constants.DEFAULT_FAIL_MESSAGE),

    //系统模块
    S000001(100_100_100, "用户不存在！"),
    S000002(100_100_101, "密码输入错误！"),

    //业务模块
    B000001(100_200_100, "手机号为空！"),
    B000002(100_200_101, "不能删除自己！"),
    B000003(100_200_102, "账号已存在！"),
    B000004(100_200_103, "身份信息不合法！"),
    B000005(100_200_104, "旧密码输入不正确！"),
    ;

    private final long code;
    private final String message;

    ResultEnum(long code, String message) {
        this.code = code;
        this.message = message;
    }
}
