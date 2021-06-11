package com.ddcat.netty;

import com.ddcat.constant.NettyConstant;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

/**
 * Netty服务端
 * 服务器的初始化和销毁都交给Spring容器
 *
 * @author dd-cat
 */
@Slf4j
@Component
public class NettyServer implements InitializingBean, DisposableBean {
    private EventLoopGroup bossGroup;
    private EventLoopGroup workGroup;
    private ChannelFuture channelFuture;

    @Override
    public void afterPropertiesSet() throws Exception {
        try {
            //创建主线程组，接收请求
            bossGroup = new NioEventLoopGroup();
            // 创建从线程组，处理主线程组分配下来的io操作
            workGroup = new NioEventLoopGroup();

            ServerBootstrap serverBootstrap = new ServerBootstrap();
            serverBootstrap.option(ChannelOption.SO_BACKLOG, 1024)
                    .group(bossGroup, workGroup)
                    .channel(NioServerSocketChannel.class)
                    .localAddress(NettyConstant.PORT)
                    .childHandler(new NettyServerInitializer());
            //启动
            channelFuture = serverBootstrap.bind().sync();
        } finally {
            if (channelFuture != null && channelFuture.isSuccess()) {
                log.info("Netty server startup on port: {} (websocket) with context path '{}'", NettyConstant.PORT, NettyConstant.PATH);
            } else {
                log.error("Netty server startup failed.");
                if (bossGroup != null) {
                    bossGroup.shutdownGracefully().sync();
                }
                if (workGroup != null) {
                    workGroup.shutdownGracefully().sync();
                }
            }
        }
    }

    @Override
    public void destroy() throws Exception {
        log.info("Shutting down Netty server...");
        if (bossGroup != null && !bossGroup.isShuttingDown() && !bossGroup.isTerminated()) {
            bossGroup.shutdownGracefully().sync();
        }
        if (workGroup != null && !workGroup.isShuttingDown() && !workGroup.isTerminated()) {
            workGroup.shutdownGracefully().sync();
        }
        if (channelFuture != null && channelFuture.isSuccess()) {
            channelFuture.channel().closeFuture().sync();
        }
        log.info("Netty server shutdown.");
    }
}
