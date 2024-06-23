package cn.morefocus.admin.module.business.sku.domain.vo;

import cn.morefocus.base.common.domain.BaseVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品初始库存 列表VO
 *
 * @author loki
 * @date 2024-06-23 11:57:41
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class SkuInitialStockVO extends BaseVO {

    private Long id;

    /**
     * 门店ID
     */
    private Long storeId;

    /**
     * 仓库ID
     */
    private Long warehouseId;

    /**
     * spuid
     */
    private Long spuId;

    /**
     * skuid
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
     * 库存ID
     */
    private Long stockId;

    /**
     * sku库存明细ID
     */
    private Long stockDetailId;
}