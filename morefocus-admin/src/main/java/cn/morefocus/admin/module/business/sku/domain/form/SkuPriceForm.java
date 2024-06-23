package cn.morefocus.admin.module.business.sku.domain.form;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品价格 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@Data
public class SkuPriceForm {
    /**
     * spuId
     */
    private Long spuId;

    /**
     * skuId
     */
    private Long skuId;

    /**
     * 单位ID
     */
    private Long unitId;

    /**
     * 单位名称
     */
    private String unitName;

    /**
     * 参考进价
     */
    private BigDecimal referencePurchasePrice;

    /**
     * 批发价
     */
    private BigDecimal tradePrice;

    /**
     * 零售价
     */
    private BigDecimal retailPrice;

    /**
     * 最低零售价
     */
    private BigDecimal retailPriceMin;
}