package com.ddcat.netty;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelId;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * TextWebSocketFrame是netty用于处理websocket发来的文本对象
 *
 * @author dd-cat
 */
@Component
@Slf4j
public class NettyHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {
    /**
     * 所有正在连接的channel都会存在这里面，所以也可以间接代表在线的客户端
     */
    public static ChannelGroup channelGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);

    /**
     * 数据集合
     */
    public static Map<ChannelId, Object> dataMap = new ConcurrentHashMap<ChannelId, Object>();

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof FullHttpRequest) {
            fullHttpRequestHandler(ctx, (FullHttpRequest) msg);
        }
        super.channelRead(ctx, msg);
    }

    /**
     * 处理连接请求，客户端WebSocket发送握手包时会执行这一次请求
     *
     * @param ctx     -
     * @param request -
     */
    private void fullHttpRequestHandler(ChannelHandlerContext ctx, FullHttpRequest request) {
        String uri = request.uri();
        Map<String, String> params = getUrlParams(uri);
        String userId = params.get("userId");

        dataMap.put(ctx.channel().id(), userId);

        //如果url包含参数，需要处理
        if (uri.contains("?")) {
            String newUri = uri.substring(0, uri.indexOf("?"));
            request.setUri(newUri);
        }
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) throws Exception {
    }

    /**
     * 客户端建立连接
     *
     * @param ctx -
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        channelGroup.add(ctx.channel());
        log.info(ctx.channel().id() + "上线了!");
    }


    /**
     * 关闭连接
     *
     * @param ctx -
     */
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        channelGroup.remove(ctx.channel());
        dataMap.remove(ctx.channel().id());
        log.info(ctx.channel().id() + "下线了!");
    }

    /**
     * 出现异常
     *
     * @param ctx   -
     * @param cause -
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
    }

    /**
     * 将路径参数转换成Map对象，如果路径参数出现重复参数名，将以最后的参数值为准
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

}
