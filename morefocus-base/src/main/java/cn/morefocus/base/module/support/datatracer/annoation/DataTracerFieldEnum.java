package cn.morefocus.base.module.support.datatracer.annoation;

import cn.morefocus.base.common.enumeration.BaseEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 字段枚举
 *
 * @author loki
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface DataTracerFieldEnum {

    Class<? extends BaseEnum> enumClass() default BaseEnum.class;

}