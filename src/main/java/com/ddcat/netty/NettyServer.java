package com.ddcat.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

/**
 * @author dd-cat
 */
public class NettyServer {
    private static int port;

    public NettyServer(int port) {
        NettyServer.port = port;
    }

    /**
     * 在main方法里调用这个方法，并用构造函数设置端口号
     *
     * @throws InterruptedException -
     */
    public void start() throws InterruptedException {
        //创建主线程组，接收请求
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        //创建从线程组，处理主线程组分配下来的io操作
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        //创建netty服务器
        try {
            ServerBootstrap serverBootstrap = new ServerBootstrap();
            //设置主从线程组
            serverBootstrap.group(bossGroup, workerGroup)
                    //设置通道
                    .channel(NioServerSocketChannel.class)
                    //子处理器，用于处理workerGroup中的操作
                    .childHandler(new NettyServerInitializer());
            //启动server
            ChannelFuture channelFuture = serverBootstrap.bind(port).sync();
            //监听关闭channel
            channelFuture.channel().closeFuture().sync();
        } finally {
            //关闭主线程
            bossGroup.shutdownGracefully();
            //关闭从线程
            workerGroup.shutdownGracefully();
        }
    }
}