package cn.morefocus.admin.module.business.category.constant;

import cn.morefocus.base.common.enums.BaseEnum;
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

    /**
     * 仓库
     */
    WAREHOUSE(3, "仓库"),

    /**
     * 附加属性
     */
    ATTRS(4, "附加属性");

    private final Integer value;

    private final String desc;
}
