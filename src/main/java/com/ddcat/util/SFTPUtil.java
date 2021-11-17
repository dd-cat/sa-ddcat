package com.ddcat.util;

import cn.hutool.extra.ssh.JschUtil;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author 张有良
 */
@Slf4j
@Component
public class SFTPUtil {

    private static String prefix;

    private static String path;

    private static String sshHost;

    private static int sshPort;

    private static String sshUser;

    private static String sshPass;

    /**
     * 上传文件
     *
     * @param fileName -
     * @param file     -
     * @return -
     * @throws SftpException
     * @throws IOException
     */
    public static String upload(final String fileName, final MultipartFile file) throws SftpException, IOException {
        final Session session = getSession();
        final ChannelSftp channel = getChannel(session);
        // 进入文件目录
        channel.cd(path);
        // 把文件流命名成文件名称推送到 Linux
        channel.put(file.getInputStream(), fileName);
        JschUtil.close(session);
        JschUtil.close(channel);
        return prefix + fileName;
    }

    public static Session getSession() {
        return JschUtil.getSession(sshHost, sshPort, sshUser, sshPass);
    }

    public static ChannelSftp getChannel(Session session) {
        return JschUtil.openSftp(session, 5000);
    }

    /**
     * 删除文件
     *
     * @param filePath 文件路径
     */
    public static void rm(final String filePath) throws SftpException {
        final Session session = getSession();
        final ChannelSftp channel = getChannel(session);
        channel.rm(filePath);
        JschUtil.close(session);
        JschUtil.close(channel);
    }

    @Value("${ddcat.upload.prefix}")
    public void setPrefix(String prefix) {
        SFTPUtil.prefix = prefix;
    }

    @Value("${ddcat.upload.path}")
    public void setPath(String path) {
        SFTPUtil.path = path;
    }

    @Value("${ddcat.jsch.host}")
    public void setSshHost(String sshHost) {
        SFTPUtil.sshHost = sshHost;
    }

    @Value("${ddcat.jsch.port}")
    public void setSshPort(int sshPort) {
        SFTPUtil.sshPort = sshPort;
    }

    @Value("${ddcat.jsch.user}")
    public void setSshUser(String sshUser) {
        SFTPUtil.sshUser = sshUser;
    }

    @Value("${ddcat.jsch.password}")
    public void setSshPass(String sshPass) {
        SFTPUtil.sshPass = sshPass;
    }
}
