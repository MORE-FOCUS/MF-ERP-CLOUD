package cn.morefocus.admin.module.business.spu.constant;

import cn.morefocus.base.common.enums.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 商品状态
 */
@AllArgsConstructor
@Getter
public enum SpuStatusEnum implements BaseEnum {

    /**
     * 1 预约中
     */
    APPOINTMENT(1, "预约中"),

    /**
     * 2 售卖
     */
    SELL(2, "售卖中"),

    /**
     * 3 售罄
     */
    SELL_OUT(3, "售罄"),

    ;

    private final Integer value;

    private final String desc;
}
