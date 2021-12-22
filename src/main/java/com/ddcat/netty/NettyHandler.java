package com.ddcat.netty;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.text.CharSequenceUtil;
import com.ddcat.constant.NettyConstant;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.util.AttributeKey;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * WebSocket连接数据接收处理类
 *
 * @author dd-cat
 */
@Component
@Slf4j
@ChannelHandler.Sharable
public class NettyHandler extends SimpleChannelInboundHandler<WebSocketFrame> {

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) {
        ctx.channel().flush();
    }

    /**
     * 客户端建立连接
     *
     * @param ctx -
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        log.info("客户端连接：{}", ctx.channel().id());
        NettyChannelPool.channels.add(ctx.channel());
        super.channelActive(ctx);
    }

    /**
     * 关闭连接
     *
     * @param ctx -
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        log.info("客户端断开连接：{}", ctx.channel().id());
        //防止被顶下线用户websocket 没有及时断开 对比Channel是否和当前在线的是否一致
        /*var key = AttributeKey.valueOf(NettyConstant.USER_ID);
        var userId = ctx.channel().attr(key).get();
        var channel = NettyChannelPool.userChannelMap.get(userId);
        if (channel != null && ctx.channel().id().asShortText().equals(channel.id().asShortText())) {
            NettyChannelPool.userChannelMap.remove(userId);
        }*/
        NettyChannelPool.channels.remove(ctx.channel());
        super.channelInactive(ctx);
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
        if (frame instanceof PingWebSocketFrame) {
            pingWebSocketFrameHandler(ctx, (PingWebSocketFrame) frame);
        } else if (frame instanceof PongWebSocketFrame) {
            pongWebSocketFrameHandler(ctx, (PongWebSocketFrame) frame);
        } else if (frame instanceof TextWebSocketFrame) {
            textWebSocketFrameHandler(ctx, (TextWebSocketFrame) frame);
        } else if (frame instanceof CloseWebSocketFrame) {
            closeWebSocketFrameHandler(ctx);
        }
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        log.info("数据类型：{}", msg.getClass());
        if (msg instanceof FullHttpRequest) {
            fullHttpRequestHandler(ctx, (FullHttpRequest) msg);
        }
        super.channelRead(ctx, msg);
    }

    /**
     * 将路径参数转换成 Map 对象，如果路径参数出现重复参数名，将以最后的参数值为准
     *
     * @param uri 传入的携带参数的路径
     * @return -
     */
    private static Map<String, String> getUrlParams(String uri) {
        var params = new HashMap<String, String>(10);
        var idx = uri.indexOf("?");
        if (idx != -1) {
            var paramsArr = uri.substring(idx + 1).split("&");

            for (String param : paramsArr) {
                idx = param.indexOf("=");
                params.put(param.substring(0, idx), param.substring(idx + 1));
            }
        }
        return params;
    }

    /**
     * 处理连接请求，客户端WebSocket发送握手包时会执行这一次请求
     *
     * @param ctx     -
     * @param request -
     */
    private void fullHttpRequestHandler(ChannelHandlerContext ctx, FullHttpRequest request) {
        var uri = request.uri();
        log.info("接收到客户端的握手包：{}", ctx.channel().id());
        var params = getUrlParams(uri);
        log.info("客户端请求参数：{}", params);
        var token = params.get("token");

        var loginId = (String) StpUtil.getLoginIdByToken(token);
        if (CharSequenceUtil.isNotBlank(loginId) && Long.parseLong(loginId) > 0) {
            //如果之前有连接 先关闭 只保留一个在线用户
            var channel = NettyChannelPool.userChannelMap.get(loginId);
            if (channel != null) {
                channel.writeAndFlush(new CloseWebSocketFrame());
            }
            // 将用户ID作为自定义属性加入到channel中，方便随时channel中获取用户ID
            var key = AttributeKey.valueOf(NettyConstant.USER_ID);
            ctx.channel().attr(key).setIfAbsent(loginId);

            NettyChannelPool.userChannelMap.put(loginId, ctx.channel());
        }
        // 如果 URL 包含参数，需要处理
        if (uri.startsWith(NettyConstant.PATH)) {
            request.setUri(NettyConstant.PATH);
        } else {
            ctx.close();
        }
    }

    /**
     * 客户端发送断开请求处理
     *
     * @param ctx -
     */
    private void closeWebSocketFrameHandler(ChannelHandlerContext ctx) {
        log.info("接收到主动断开请求：{}", ctx.channel().id());
        ctx.close();
    }

    /**
     * 创建连接之后，客户端发送的消息都会在这里处理
     *
     * @param ctx   -
     * @param frame -
     */
    private void textWebSocketFrameHandler(ChannelHandlerContext ctx, TextWebSocketFrame frame) {
        var text = frame.text();
        log.info("接收到客户端的消息：{}", text);
        // 将客户端消息回送给客户端
        ctx.channel().writeAndFlush(new TextWebSocketFrame("你发送的内容是：" + text));
    }

    /**
     * 处理客户端心跳包
     *
     * @param ctx   -
     * @param frame -
     */
    private void pingWebSocketFrameHandler(ChannelHandlerContext ctx, PingWebSocketFrame frame) {
        ctx.channel().writeAndFlush(new PongWebSocketFrame(frame.content().retain()));
    }

    /**
     * 处理客户端心跳包
     *
     * @param ctx   -
     * @param frame -
     */
    private void pongWebSocketFrameHandler(ChannelHandlerContext ctx, PongWebSocketFrame frame) {
        ctx.channel().writeAndFlush(new PingWebSocketFrame(frame.content().retain()));
    }
}
