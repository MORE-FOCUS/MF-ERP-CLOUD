package cn.morefocus.admin.module.business.bill.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * 单据明细 列表VO
 *
 * @author loki
 * @date 2024-07-04 23:47:57
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class BillDetailVO extends BaseVO {

    private Long id;

    /**
     * 单据ID
     */
    private Long billId;

    /**
     * 商品ID
     */
    private Long skuId;

    /**
     * 商品ID
     */
    private Long spuId;

    /**
     * 购货数量/销售数量/退货数量
     */
    private BigDecimal quantity;

    /**
     * 购货单价
     */
    private BigDecimal price;

    /**
     * 含税单价
     */
    private BigDecimal priceTax;

    /**
     * 总金额=数量*单价
     */
    private BigDecimal amount;

    /**
     * 仓库ID
     */
    private Long warehouseId;

    /**
     * 交货日期
     */
    private LocalDate deliveryDate;

    /**
     * 入库数量
     */
    private BigDecimal storeQuantity;

    /**
     * 关联订单ID
     */
    private Long srcOrderId;

    /**
     * 关联订单号
     */
    private String srcOrderNo;

    /**
     * 税率
     */
    private BigDecimal taxRate;

    /**
     * 税额
     */
    private BigDecimal tax;

    /**
     * 价税合计金额
     */
    private BigDecimal taxAmount;

    /**
     * 折扣率
     */
    private BigDecimal discountRate;

    /**
     * 折扣金额
     */
    private BigDecimal discountAmount;
}