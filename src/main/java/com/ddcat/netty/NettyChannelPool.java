package com.ddcat.netty;

import io.netty.channel.Channel;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.experimental.UtilityClass;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author 张有良
 */
@UtilityClass
public class NettyChannelPool {
    /**
     * 存放用户与Chanel的对应信息
     */
    public Map<String, Channel> userChannelMap = new ConcurrentHashMap<>();
    /**
     * 所有正在连接的Chanel都会存在这里面，所以也可以间接代表在线的客户端
     */
    public ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

}
