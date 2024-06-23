package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品价格 实体类
 *
 * @author loki
 * @date 2024-04-16 23:57:58
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuPriceVO extends BaseVO {

    /**
     * ID
     */
    private Long id;

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