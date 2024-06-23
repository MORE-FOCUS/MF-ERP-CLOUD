package cn.morefocus.admin.module.business.sku.domain.form;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品库存预警 列表VO
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@Data
public class SkuWarnConfigForm {

    private Integer id;

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
     * spuId
     */
    private Long spuId;

    /**
     * 单位ID
     */
    private Long unitId;

    /**
     * 最小库存预警
     */
    private BigDecimal minQuantity;

    /**
     * 最大库存预警
     */
    private BigDecimal maxQuantity;
}