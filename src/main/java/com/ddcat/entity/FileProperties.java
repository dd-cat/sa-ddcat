package com.ddcat.entity;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author dd-cat
 */
@Data
@ConfigurationProperties(prefix = "file")
public class FileProperties {
    /**
     * 访问前缀
     */
    private String prefix;

    /**
     * 服务器存储路径
     */
    private String path;

}
