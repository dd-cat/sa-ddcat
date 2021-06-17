package com.ddcat.listener;

import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.stp.SaLoginModel;
import com.ddcat.netty.NettyHandler;
import io.netty.channel.Channel;
import io.netty.handler.codec.http.websocketx.CloseWebSocketFrame;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * @author dd-cat
 */
@Component
public class MySaTokenListener implements SaTokenListener {

    /**
     * 每次登录时触发
     */
    @Override
    public void doLogin(String loginKey, Object loginId, SaLoginModel loginModel) {
        // ...
    }

    /**
     * 每次注销时触发
     */
    @Override
    public void doLogout(String loginKey, Object loginId, String tokenValue) {
        // ...
    }

    /**
     * 每次被踢下线时触发
     */
    @Override
    public void doLogoutByLoginId(String loginKey, Object loginId, String tokenValue, String device) {
        // ...
    }

    /**
     * 每次被顶下线时触发
     */
    @Override
    public void doReplaced(String loginKey, Object loginId, String tokenValue, String device) {
        //被顶下线如果 websocket在连接 就通知客户端关闭
        Map<String, Channel> userChannelMap = NettyHandler.userChannelMap;
        Channel channel = userChannelMap.get(loginId.toString());
        if (channel != null) {
            channel.writeAndFlush(new CloseWebSocketFrame());
        }
    }

    /**
     * 每次被封禁时触发
     */
    @Override
    public void doDisable(String loginKey, Object loginId, long disableTime) {
        // ...
    }

    /**
     * 每次被解封时触发
     */
    @Override
    public void doUntieDisable(String loginKey, Object loginId) {
        // ...
    }

    /**
     * 每次创建Session时触发
     */
    @Override
    public void doCreateSession(String id) {
        // ...
    }

    /**
     * 每次注销Session时触发
     */
    @Override
    public void doLogoutSession(String id) {
        // ...
    }

}
