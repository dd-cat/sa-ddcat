package com.ddcat.service;

import com.ddcat.entity.common.Result;
import com.jcraft.jsch.SftpException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author 张有良
 */
public interface UploadService {
    /**
     * 上传图片
     *
     * @param file -
     * @return -
     */
    Result<String> uploadPicture(MultipartFile file) throws SftpException, IOException;
}
