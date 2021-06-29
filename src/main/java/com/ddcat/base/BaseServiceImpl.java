package com.ddcat.base;

import com.baomidou.mybatisplus.core.metadata.TableInfo;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;

import java.io.Serializable;
import java.lang.reflect.Field;

/**
 * @author dd-cat
 */
public class BaseServiceImpl<M extends SuperMapper<T>, T> extends ServiceImpl<M, T> implements BaseService<T> {
    @Override
    public boolean deleteByIdWithFill(Serializable id) throws Exception {
        Class<?> cls = this.entityClass;
        Object obj = cls.getDeclaredConstructor().newInstance();
        TableInfo tableInfo = TableInfoHelper.getTableInfo(cls);

        Field field = cls.getDeclaredField(tableInfo.getKeyProperty());
        field.set(obj, id);
        return SqlHelper.retBool(getBaseMapper().deleteByIdWithFill((T) obj));
    }

    @Override
    public boolean deleteByIdWithFill(T entity) {
        return SqlHelper.retBool(getBaseMapper().deleteByIdWithFill(entity));
    }
}
