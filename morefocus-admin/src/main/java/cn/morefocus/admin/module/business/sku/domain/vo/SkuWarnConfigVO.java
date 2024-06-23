package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品库存预警 列表VO
 *
 * @author loki
 * @date 2024-06-23 12:20:59
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuWarnConfigVO extends BaseVO {

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
     * skuid
     */
    private Long skuId;

    /**
     * spuid
     */
    private Long spuId;

    /**
     * 最小库存预警
     */
    private BigDecimal minQuantity;

    /**
     * 最大库存预警
     */
    private BigDecimal maxQuantity;

}