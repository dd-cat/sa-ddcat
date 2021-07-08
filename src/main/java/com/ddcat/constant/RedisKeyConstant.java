package com.ddcat.constant;

/**
 * Redis key常量
 *
 * @author dd-cat
 */
public final class RedisKeyConstant {
    /**
     * 私有构造方法避免创建该类的实例
     */
    private RedisKeyConstant() {
    }

    /**
     * 字典
     */
    public static final String DICT = "dict";
    /**
     * 用户
     */
    public static final String USER = "user";
    /**
     * 角色菜单
     */
    public static final String ROLE_MENU = "role:menu";
}
