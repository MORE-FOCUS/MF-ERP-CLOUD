package cn.morefocus.admin.module.business.bill.constant;

import cn.morefocus.base.common.enums.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 单据类型常量
 */
@AllArgsConstructor
@Getter
public enum BillStatusEnum implements BaseEnum {
    /**
     * 101 购货订单
     */
    GHDD(101, "购货订单"),

    /**
     * 102 购货单
     */
    GHD(102, "购货单"),

    /**
     * 103 购货退货单
     */
    GHTH(103, "购货退货单"),

    /**
     * 201 销货订单
     */
    XHDD(201, "销货订单"),

    /**
     * 202 销货单
     */
    XHD(202, "销货单"),

    /**
     * 203 销货退货单
     */
    XHTH(203, "销货退货单"),
    ;

    private final Integer value;

    private final String desc;
}
