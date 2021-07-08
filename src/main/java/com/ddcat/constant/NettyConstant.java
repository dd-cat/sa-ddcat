package com.ddcat.constant;

/**
 * Netty常量
 *
 * @author dd-cat
 */
public final class NettyConstant {
    /**
     * 私有构造方法避免创建该类的实例
     */
    private NettyConstant() {
    }

    /**
     * 监听端口
     */
    public static final Integer PORT = 12567;
    /**
     * 请求路径
     */
    public static final String PATH = "/ws";
    /**
     * Netty 用户key
     */
    public static final String USER_ID = "user_id";
}
