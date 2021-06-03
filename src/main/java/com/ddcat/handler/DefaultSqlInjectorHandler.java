package com.ddcat.handler;

import com.baomidou.mybatisplus.core.injector.AbstractMethod;
import com.baomidou.mybatisplus.core.injector.DefaultSqlInjector;
import com.baomidou.mybatisplus.extension.injector.methods.LogicDeleteByIdWithFill;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author dd-cat
 */
@Component
public class DefaultSqlInjectorHandler extends DefaultSqlInjector {

    @Override
    public List<AbstractMethod> getMethodList(Class<?> mapperClass) {
        List<AbstractMethod> methodList = super.getMethodList(mapperClass);

        //省略其他选装件和自定义方法...

        //2.官方选装件，逻辑删除时，自动填充其他字段（例如逻辑删除时，自动填充删除人是谁，什么时候删除的）
        methodList.add(new LogicDeleteByIdWithFill());
        return methodList;
    }
}
