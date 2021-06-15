package com.ddcat.constant;

/**
 * 通用常量信息
 *
 * @author dd-cat
 */
public interface Constants {

    /**
     * 成功标记
     */
    int SUCCESS = 200;

    /**
     * 失败标记
     */
    int FAIL = 500;

    /**
     * 默认成功消息
     */
    String DEFAULT_SUCCESS_MESSAGE = "Success!";
    /**
     * 默认失败消息
     */
    String DEFAULT_FAIL_MESSAGE = "Error!";

    /**
     * 用户默认ID 用来无需登录接口默认用户用
     */
    long USER_ID = 0L;
}
