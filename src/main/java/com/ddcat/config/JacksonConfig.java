package com.ddcat.config;

import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author dd-cat
 */
@Configuration
public class JacksonConfig {

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer builderCustomizer() {
        return builder -> {
            // JS数字精度小于Java long 返回数据时把long类型属性转为字符串类型Jackson
            builder.serializerByType(long.class, ToStringSerializer.instance);
            // 基本类型和基本类型包子类型需分开设置
            builder.serializerByType(Long.class, ToStringSerializer.instance);
        };
    }
}