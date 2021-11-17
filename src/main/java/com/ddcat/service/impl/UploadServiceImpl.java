package com.ddcat.service.impl;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.ddcat.entity.common.Result;
import com.ddcat.enums.ResultEnum;
import com.ddcat.exception.BusinessException;
import com.ddcat.service.UploadService;
import com.ddcat.util.SFTPUtil;
import com.jcraft.jsch.SftpException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author 张有良
 */
@Service
public class UploadServiceImpl implements UploadService {
    @Override
    public Result<String> uploadPicture(MultipartFile file) throws SftpException, IOException {
        if (file == null || file.isEmpty()) {
            throw new BusinessException(ResultEnum.B000013);
        }
        String fileName = "picture/" + IdUtil.simpleUUID() + "." + FileUtil.getSuffix(file.getOriginalFilename());
        return Result.success(SFTPUtil.upload(fileName, file));
    }
}
