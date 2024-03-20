package cn.morefocus.base.module.support.operatelog.annotation;

import java.lang.annotation.*;

/**
 * 用户操作日志 注解
 *
 * @author loki
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
@Documented
public @interface OperateLog {

}
