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
    ;

    private final long code;
    private final String message;

    ResultEnum(long code, String message) {
        this.code = code;
        this.message = message;
    }
}
