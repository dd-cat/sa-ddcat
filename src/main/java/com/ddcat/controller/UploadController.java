package com.ddcat.controller;

import com.ddcat.entity.common.Result;
import com.ddcat.service.UploadService;
import com.jcraft.jsch.SftpException;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author 张有良
 */
@RestController
@RequestMapping("upload")
@RequiredArgsConstructor
public class UploadController {
    private final UploadService service;

    /**
     * 上传图片
     *
     * @return -
     */
    @PostMapping
    public Result<String> uploadPicture(MultipartFile file) throws IOException, SftpException {
        return service.uploadPicture(file);
    }
}
