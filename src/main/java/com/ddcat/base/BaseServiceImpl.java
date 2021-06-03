package com.ddcat.base;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;

/**
 * @author dd-cat
 */
public class BaseServiceImpl<M extends SuperMapper<T>, T> extends ServiceImpl<M, T> implements BaseService<T> {
    @Override
    public boolean deleteByIdWithFill(T entity) {
        return SqlHelper.retBool(getBaseMapper().deleteByIdWithFill(entity));
    }
}
