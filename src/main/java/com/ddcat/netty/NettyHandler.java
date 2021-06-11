package com.ddcat.netty;

import com.ddcat.constant.NettyConstant;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.websocketx.*;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * WebSocket连接数据接收处理类
 *
 * @author dd-cat
 */
@Component
@Slf4j
@ChannelHandler.Sharable
public class NettyHandler extends SimpleChannelInboundHandler<WebSocketFrame> {
    private static ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    /**
     * userId数据集合
     */
    public static Map<String, String> dataMap = new ConcurrentHashMap<>();

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
        channels.add(ctx.channel());
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
        dataMap.remove(ctx.channel().id().asShortText());
        channels.remove(ctx.channel());
        super.channelInactive(ctx);
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
        if (frame instanceof PingWebSocketFrame) {
            pingWebSocketFrameHandler(ctx, (PingWebSocketFrame) frame);
        } else if (frame instanceof TextWebSocketFrame) {
            textWebSocketFrameHandler(ctx, (TextWebSocketFrame) frame);
        } else if (frame instanceof CloseWebSocketFrame) {
            closeWebSocketFrameHandler(ctx, (CloseWebSocketFrame) frame);
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
        Map<String, String> params = new HashMap<>(10);
        int idx = uri.indexOf("?");
        if (idx != -1) {
            String[] paramsArr = uri.substring(idx + 1).split("&");

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
        String uri = request.uri();
        log.info("接收到客户端的握手包：{}", ctx.channel().id());
        Map<String, String> params = getUrlParams(uri);
        log.info("客户端请求参数：{}", params);
        String userId = params.get("userId");

        dataMap.put(ctx.channel().id().asShortText(), userId);
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
     * @param ctx   -
     * @param frame -
     */
    private void closeWebSocketFrameHandler(ChannelHandlerContext ctx, CloseWebSocketFrame frame) {
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
        String text = frame.text();
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
}
