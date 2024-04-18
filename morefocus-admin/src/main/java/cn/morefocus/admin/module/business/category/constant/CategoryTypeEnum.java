package cn.morefocus.admin.module.business.category.constant;

import cn.morefocus.base.common.enumeration.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 分类类型 枚举
 */
@AllArgsConstructor
@Getter
public enum CategoryTypeEnum implements BaseEnum {

    /**
     * 1 商品
     */
    GOODS(1, "商品"),

    /**
     * 2 供应商
     */
    SUPPLIER(2, "供应商"),

    ;

    private final Integer value;

    private final String desc;
}
