package cn.morefocus.admin.module.business.sku.domain.form;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品初始库存 列表VO
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@Data
public class SkuInitialStockForm {
    /**
     * 门店ID
     */
    private Long storeId;

    /**
     * 仓库ID
     */
    private Long warehouseId;

    /**
     * skuId
     */
    private Long skuId;

    /**
     * 单价
     */
    private BigDecimal price;

    /**
     * 初始库存
     */
    private BigDecimal quantity;

    /**
     * 初始总金额
     */
    private BigDecimal amount;
}