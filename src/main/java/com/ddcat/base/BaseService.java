package com.ddcat.base;

import com.baomidou.mybatisplus.extension.service.IService;

import java.io.Serializable;

/**
 * @author dd-cat
 */
public interface BaseService<T> extends IService<T> {
    /**
     * 逻辑删除并填充字段
     *
     * @param id 实体对象
     * @return /
     */
    boolean deleteByIdWithFill(Serializable id) throws Exception;

    /**
     * 逻辑删除并填充字段
     *
     * @param entity 实体对象
     * @return /
     */
    boolean deleteByIdWithFill(T entity);
}
