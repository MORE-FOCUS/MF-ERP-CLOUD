package cn.morefocus.base.handler;

import cn.morefocus.base.common.util.RequestContext;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 自动赋值
 * 创建时间/创建人ID/创建人名称
 * 更新时间/更新人ID/更新人名称
 */
@Slf4j
@Component
public class DefaultDataFillHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("createTime", LocalDateTime.now(), metaObject);
        this.setFieldValByName("createBy", RequestContext.getUserId(), metaObject);
        this.setFieldValByName("createByName", RequestContext.getUserName(), metaObject);
        updateFill(metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateTime", LocalDateTime.now(), metaObject);
        this.setFieldValByName("updateBy", RequestContext.getUserId(), metaObject);
        this.setFieldValByName("updateByName", RequestContext.getUserName(), metaObject);
    }
}
