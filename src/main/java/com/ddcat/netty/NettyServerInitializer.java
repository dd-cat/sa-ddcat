package com.ddcat.netty;

import com.ddcat.constant.NettyConstant;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.codec.http.websocketx.extensions.compression.WebSocketServerCompressionHandler;
import io.netty.handler.stream.ChunkedWriteHandler;
import org.springframework.stereotype.Component;

/**
 * WebSocket通道连接初始化
 *
 * @author dd-cat
 */
@Component
public class NettyServerInitializer extends ChannelInitializer<SocketChannel> {

    @Override
    protected void initChannel(SocketChannel socketChannel) {
        socketChannel.pipeline()
                // 以下三个是Http的支持
                // HTTP 解码器
                .addLast(new HttpServerCodec())
                // 分块向客户端写数据，防止发送大文件时导致内存溢出
                .addLast(new ChunkedWriteHandler())
                //http聚合器 需要放到HttpServerCodec这个处理器后面
                .addLast(new HttpObjectAggregator(8192))
                // webSocket 数据压缩扩展，当添加这个的时候WebSocketServerProtocolHandler的第三个参数需要设置成true
                .addLast(new WebSocketServerCompressionHandler())
                //添加自定义的助手类
                .addLast(new NettyHandler())
                //服务器端向外暴露的 web socket 端点，当客户端传递比较大的对象时，maxFrameSize参数的值需要调大
                .addLast(new WebSocketServerProtocolHandler(NettyConstant.PATH, null, true, 10485760));

    }
}

