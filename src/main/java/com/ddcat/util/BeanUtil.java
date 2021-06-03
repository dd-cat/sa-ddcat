package com.ddcat.util;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ddcat.entity.common.PageEntity;
import lombok.SneakyThrows;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dd-cat
 */
public class BeanUtil extends BeanUtils {
    /**
     * 复制List实体
     *
     * @param list -
     * @param type -
     * @return -
     */
    @SneakyThrows
    public static <A, B> List<B> convertList(List<A> list, Class<B> type) {
        List<B> result = new ArrayList<>();
        for (A a : list) {
            B response = type.newInstance();
            BeanUtils.copyProperties(a, response);
            result.add(response);
        }
        return result;
    }

    public static <T> PageEntity<T> toPage(Page page, Class<T> type) {
        List<T> list = BeanUtil.convertList(page.getRecords(), type);
        return new PageEntity(list, page.getTotal());
    }
}